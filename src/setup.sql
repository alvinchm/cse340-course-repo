CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);


INSERT INTO organization (name, description, contact_email, logo_filename)
VALUES
('BrightFuture Builders', 'A nonprofit focused on improving community infrastructure through sustainable construction projects.', 'info@brightfuturebuilders.org', 'brightfuture-logo.png'),
('GreenHarvest Growers', 'An urban farming collective promoting food sustainability and education in local neighborhoods.', 'contact@greenharvest.org', 'greenharvest-logo.png'),
('UnityServe Volunteers', 'A volunteer coordination group supporting local charities and service initiatives.', 'hello@unityserve.org', 'unityserve-logo.png');

CREATE TABLE project (
    project_id SERIAL PRIMARY KEY,
    organization_id INT NOT NULL,
    title VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(150) NOT NULL,
    project_date DATE NOT NULL,
    CONSTRAINT fk_organization
        FOREIGN KEY(organization_id) 
        REFERENCES organization(organization_id)
);

INSERT INTO project (organization_id, title, description, location, project_date)
VALUES
(1, 'Community Center Repair', 'Fixing the roof of the local center.', 'Downtown', '2026-11-20'),
(1, 'Park Bench Painting', 'Painting old benches in the main park.', 'City Park', '2026-11-25'),
(1, 'Playground Safety Update', 'Replacing old sand with safety mats.', 'North Park', '2026-12-05'),
(1, 'Library Shelf Building', 'Building new shelves for the library.', 'Main Library', '2026-12-10'),
(1, 'Street Light Maintenance', 'Assisting with replacing old bulbs.', 'South District', '2026-12-15'),
(2, 'Urban Garden Planting', 'Planting winter crops in the city garden.', 'Green St.', '2026-11-22'),
(2, 'Compost Workshop', 'Teaching locals how to make compost.', 'Community Garden', '2026-11-28'),
(2, 'Fruit Tree Pruning', 'Pruning the community fruit trees.', 'East Park', '2026-12-02'),
(2, 'Seed Swap Event', 'Organizing a seed exchange for farmers.', 'Town Hall', '2026-12-08'),
(2, 'Irrigation Setup', 'Installing drip irrigation for vegetables.', 'Green St.', '2026-12-12'),
(3, 'Soup Kitchen Volunteer', 'Serving food to the homeless.', 'Downtown Shelter', '2026-11-21'),
(3, 'Winter Coat Drive', 'Collecting winter coats for families.', 'Community Mall', '2026-11-29'),
(3, 'Elderly Care Visit', 'Spending time with seniors at the home.', 'Sunny Days Care', '2026-12-03'),
(3, 'Food Bank Sorting', 'Sorting donated food boxes.', 'Central Food Bank', '2026-12-09'),
(3, 'Holiday Gift Wrapping', 'Wrapping gifts for underprivileged kids.', 'Town Square', '2026-12-18');

CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL
);

CREATE TABLE project_category (
    project_id INT NOT NULL,
    category_id INT NOT NULL,
    PRIMARY KEY (project_id, category_id),
    CONSTRAINT fk_project FOREIGN KEY(project_id) REFERENCES project(project_id),
    CONSTRAINT fk_category FOREIGN KEY(category_id) REFERENCES category(category_id)
);

INSERT INTO category (name) VALUES
('Environmental'),
('Education'),
('Community Support');

INSERT INTO project_category (project_id, category_id) VALUES
(1, 3), (2, 1), (3, 3), (4, 2), (5, 3),
(6, 1), (7, 1), (8, 1), (9, 2), (10, 1),
(11, 3), (12, 3), (13, 3), (14, 3), (15, 3);