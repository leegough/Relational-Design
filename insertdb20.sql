
INSERT INTO `building` (`building_id`, `street_name`, `street_no`, `post_code`) VALUES
(1, 'Ashfield Street', 12, 'BT97SU'),
(2, 'Linhall Street', 13, 'BT96SU'),
(5, 'Ashgreen Street', 15, 'BT95FU'),
(7, 'Greenvale Road', 17, 'BT93ER'),
(11, 'Tigan Street', 26, 'BT98UJ');

INSERT INTO `apartment` (`building_id`, `apart_no`, `bedroom_no`, `bathroom_no`, `area_sq_feet`) VALUES
(1, 1, 1, 1, '400'),
(2, 2, 2, 2, '550'),
(5, 3, 1, 1, '450'),
(7, 4, 2, 2, '550'),
(11, 5, 2, 1, '500'),
(1, 6, 1, 1, '375'),
(2, 7, 2, 1, '500'),
(5, 8, 2, 1, '550'),
(7, 9, 3, 2, '660'),
(11, 10, 2, 1, '550'),
(1, 11, 2, 2, '600'),
(2, 12, 3, 2, '550'),
(5, 13, 2, 2, '550'),
(7, 14, 1, 1, '400'),
(11, 15, 1, 1, '500');

INSERT INTO `person` (`person_id`, `first_name`, `last_name`) VALUES
(1, 'John', 'Robinson'),
(2, 'Phillip', 'Cena'),
(3, 'Meghan', 'Phillips'),
(4, 'Kate', 'Johnson'),
(5, 'Ryan', 'Roberts'),
(6, 'Peter', 'Stevenson'),
(7, 'Charles', 'Strife'),
(8, 'Diana', 'Rothwell'),
(9, 'Harry', 'Wasson'),
(10, 'Elizabeth', 'Ingram');

INSERT INTO `person_number` (`person_id`, `number`) VALUES
(1, '07543242242'),
(2, '07954532524'),
(3, '07856432544'),
(4, '07755434344'),
(5, '07867367343'),
(6, '07842345354'),
(7, '07932576435'),
(8, '07537747381'),
(9, '07426645563'),
(10, '07435634353');

INSERT INTO `lease_agreement` (`lease_id`, `start_date`, `monthly_duration`, `monthly_rent`) VALUES
(1111, '2016-11-09', 6, '550'),
(1112, '2016-10-02', 6, '550'),
(1113, '2016-09-08', 6, '600'),
(1114, '2016-09-01', 12, '500'),
(1115, '2016-09-01', 12, '600'),
(1116, '2016-08-02', 12, '550'),
(1117, '2016-09-01', 6, '550'),
(1118, '2016-07-01', 12, '500'),
(1119, '2016-08-02', 12, '600'),
(1120, '2016-07-02', 6, '550');

INSERT INTO `employee` (`person_id`, `monthly_salary`) VALUES
(1, '2500'),
(2, '2000'),
(3, '2500'),
(4, '2650'),
(5, '2500'),
(6, '1800'),
(7, '1800'),
(8, '2500'),
(9, '2650'),
(10, '2000');

INSERT INTO `tenant` (`person_id`, `account_no`) VALUES
(7, 81234513),
(4, 81514513),
(9, 85674783),
(5, 85722523),
(3, 86534243),
(1, 86574543),
(8, 86784243),
(2, 88572543),
(10,88973513),
(6, 89974943);

INSERT INTO `technician` (`tech_id`, `monthly_salary`) VALUES
(1, '1800'),
(2, '1800'),
(3, '2000'),
(4, '2000'),
(5, '2500'),
(6, '2500'),
(7, '2500'),
(8, '2500'),
(9, '2650'),
(10, '2650');


INSERT INTO `tech_skills` (`tech_id`, `skills`) VALUES
(1, 'carpentry, plumbing'),
(2, 'electrical'),
(3, 'plumbing'),
(4, 'electrical, plumbing'),
(5, 'electrical'),
(6, 'plumbing'),
(7, 'carpentry, electrical'),
(8, 'plumbing, electrical, carpentry'),
(9, 'carpentry'),
(10, 'carpentry, plumbing');

INSERT INTO `manager` (`manager_id`, `monthly_salary`) VALUES
(1, '1800'),
(2, '1800'),
(3, '2000'),
(4, '2000'),
(5, '2500'),
(6, '2500'),
(7, '2500'),
(8, '2500'),
(9, '2650'),
(10, '2650');

INSERT INTO `manages` (`manager_id`, `apart_no`, `guest`) VALUES
(1, 1, 0),
(1, 2, 0),
(1, 3, 1),
(2, 4, 0),
(2, 5, 2),
(3, 6, 0),
(4, 7, 0),
(5, 8, 1),
(6, 9, 0),
(7, 10, 2),
(7, 11, 1),
(8, 12, 0),
(8, 13, 0),
(9, 14, 0),
(10, 15, 1);

INSERT INTO `has_office` (`manager_id`, `apart_no`) VALUES
(1, 1),
(10, 2),
(2, 3),
(3, 5),
(8, 8),
(7, 9),
(6, 10),
(4, 11),
(9, 13),
(5, 15);

INSERT INTO `m_sign` (`manager_id`, `lease_id`) VALUES
(1, 1111),
(2, 1112),
(3, 1113),
(4, 1114),
(5, 1115),
(6, 1116),
(7, 1117),
(8, 1118),
(9, 1119),
(10, 1120);

INSERT INTO `t_sign` (`person_id`, `lease_id`) VALUES
(7, 1111),
(4, 1112),
(9, 1113),
(5, 1114),
(3, 1115),
(1, 1116),
(8, 1117),
(2, 1118),
(10, 1119),
(6, 1120);

INSERT INTO `for` (`lease_id`, `apart_no`) VALUES
(1111, 1),
(1112, 2),
(1113, 3),
(1114, 4),
(1115, 5),
(1116, 6),
(1117, 7),
(1118, 8),
(1119, 9),
(1120, 10);

