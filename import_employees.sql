CREATE TABLE employees(
    id SERIAL PRIMARY KEY,
    Education VARCHAR(100),
    JoiningYear VARCHAR(100),
    City VARCHAR(100),
    PaymentTier INTEGER,
    Age INTEGER,
    Gender VARCHAR(100),
    EverBenched VARCHAR(100),
    ExperienceInCurrentDomain INTEGER,
    LeaveOrNot INTEGER
);