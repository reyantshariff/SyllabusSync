CREATE TABLE users(  
    id int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    create_time DATE,
    email VARCHAR(255) UNIQUE NOT NULL,
    name TEXT NOT NULL,
    password TEXT NOT NULL
);
COMMENT ON TABLE users IS 'Stores registered users for SyllabusSync.';
COMMENT ON COLUMN users.name IS 'The display name of the user.';

CREATE TABLE courses(
    id int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    create_time DATE,
    course_name TEXT NOT NULL,
    user_id int NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    UNIQUE(course_name, user_id)
);

COMMENT ON TABLE courses IS 'Stores courses created by users.';
COMMENT ON COLUMN courses.course_name IS 'The name of the course.';

CREATE TABLE deadlines(
    id int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    create_time DATE,
    course_id int NOT NULL REFERENCES courses(id) ON DELETE CASCADE,
    deadline_date DATE NOT NULL,
    description TEXT NOT NULL
);