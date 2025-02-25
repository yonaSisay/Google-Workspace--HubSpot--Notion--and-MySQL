USE localdb;

CREATE TABLE `contacts` (
    `contacts_id` INT AUTO_INCREMENT PRIMARY KEY,
    `first_name` NVARCHAR(200), -- Pulled from HubSpot
    `last_name` NVARCHAR(200), -- Pulled from HubSpot
    `email_address` VARCHAR(255) UNIQUE,
    `title` NVARCHAR(100), -- Pulled from HubSpot
    `hubspot_contact_objectid` NVARCHAR(50), -- The ObjectID in HubSpot for this Contact
    `hubspot_company_objectid` NVARCHAR(50), -- The ObjectID in HubSpot for related Company
    `displayname` NVARCHAR(200), -- Temporary name of this person, used for manual operations
    `created_datetime_utc` DATETIME, -- Database row created datetime in UTC
    `updated_datetime_utc` DATETIME -- Database row updated datetime in UTC
);

CREATE TABLE `emails` (
    `emails_id` INT AUTO_INCREMENT PRIMARY KEY,
  	`google_email_id` VARCHAR(255) UNIQUE, -- Google Workspace Email ID
    `email_subject` VARCHAR(255), -- Email Subject
    `email_body` TEXT, -- Email Body, can be HTML or text
    `sent_datetime_utc` DATETIME, -- Email sent datetime in UTC
    `received_datetime_utc` DATETIME, -- Email received datetime in UTC
    `created_datetime_utc` DATETIME, -- Database row created datetime in UTC
    `updated_datetime_utc` DATETIME -- Database row updated datetime in UTC
);

CREATE TABLE `calendarevents` (
    `calendarevents_id` INT AUTO_INCREMENT PRIMARY KEY,
  	`google_calendar_event_id` VARCHAR(255) UNIQUE, -- Google Workspace Calendar Event ID
    `title` VARCHAR(255), -- Title of the event
    `start_datetime_utc` DATETIME,
    `end_datetime_utc` DATETIME, -- End time of the event in UTC
    `location` VARCHAR(255), -- Location of event
    `description` TEXT, -- Description of event, can be HTML or text
    `deleted_datetime_utc` DATETIME, -- Soft delete column
    `recurring_event_id` VARCHAR(255), -- For recurring events
    `created_datetime_utc` DATETIME, -- Database row created datetime in UTC
    `updated_datetime_utc` DATETIME -- Database row updated datetime in UTC
);

CREATE TABLE `emailcontacts` (
    `emails_id` INT, -- Unique identifier of email
    `contacts_id` INT, -- Unique identifier of contacts
    `relationship_type` ENUM('sender', 'recipient', 'cc', 'bcc'), -- Type of relationship
    PRIMARY KEY (`emails_id`, `contacts_id`, `relationship_type`),
    FOREIGN KEY (`emails_id`) REFERENCES `emails`(`emails_id`),
    FOREIGN KEY (`contacts_id`) REFERENCES `contacts`(`contacts_id`)
);

CREATE TABLE `eventcontacts` (
    `calendarevents_id` INT, -- Unique identifier of calendar events
    `contacts_id` INT, -- Unique identifier of contacts
    `relationship_type` ENUM('organizer', 'attendee'), -- Type of relationship
    PRIMARY KEY (`calendarevents_id`, `contacts_id`, `relationship_type`),
    FOREIGN KEY (`calendarevents_id`) REFERENCES `calendarevents`(`calendarevents_id`),
    FOREIGN KEY (`contacts_id`) REFERENCES `contacts`(`contacts_id`)
);