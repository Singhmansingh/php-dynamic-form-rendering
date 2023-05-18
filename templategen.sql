-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: May 18, 2023 at 12:35 AM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `templategen`
--

-- --------------------------------------------------------

--
-- Table structure for table `form_fields`
--

CREATE TABLE `form_fields` (
  `id` int(11) NOT NULL,
  `segment_type_id` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `form_fields`
--

INSERT INTO `form_fields` (`id`, `segment_type_id`, `type`, `label`, `name`) VALUES
(1, 1, 'text', 'Headline', 'headline'),
(2, 1, 'text', 'Tagline', 'subtitle'),
(3, 1, 'date', 'Date', 'incident_date'),
(4, 1, 'textarea', 'content', 'content'),
(5, 2, 'text', 'question', 'question'),
(6, 2, 'text', 'answer', 'answer'),
(7, 3, 'text', 'setup', 'setup'),
(8, 3, 'text', 'punchline', 'punchline'),
(9, 3, 'text', 'Wrong Answer', 'wrong_answer');

-- --------------------------------------------------------

--
-- Table structure for table `segments`
--

CREATE TABLE `segments` (
  `id` int(11) NOT NULL,
  `segment_type_id` int(11) DEFAULT NULL,
  `data` longtext,
  `segment_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `segments`
--

INSERT INTO `segments` (`id`, `segment_type_id`, `data`, `segment_name`) VALUES
(1, 2, '{&quot;question&quot;:&quot;why did the chicken cross the road?&quot;,&quot;answer&quot;:&quot;idk why do any of us do anything&quot;}', 'Why the chicken crossed the road'),
(2, 1, '{&quot;segment_name&quot;:&quot;wefwef&quot;,&quot;headline&quot;:&quot;wefwe&quot;,&quot;subtitle&quot;:&quot;aef&quot;,&quot;incident_date&quot;:&quot;0022-02-02&quot;,&quot;content&quot;:&quot;12312&quot;}', 'Random'),
(3, 1, '{&quot;headline&quot;:&quot;A sensational title&quot;,&quot;subtitle&quot;:&quot;new study; people don\'t read more than the tagline&quot;,&quot;incident_date&quot;:&quot;1999-12-30&quot;,&quot;content&quot;:&quot;This is a great article. Sucks no one will read it. I will tell you the secret of my people. Everyone. Is. John.&quot;}', 'Does this work'),
(4, 1, '{&quot;headline&quot;:&quot;medellin lego city&quot;,&quot;subtitle&quot;:&quot;city add&quot;,&quot;incident_date&quot;:&quot;2023-05-16&quot;,&quot;content&quot;:&quot;new lego city based on medellin&quot;}', 'medellin lego city'),
(5, 2, '[]', ''),
(6, 1, '{&quot;headline&quot;:&quot;qwe&quot;,&quot;subtitle&quot;:&quot;qwe&quot;,&quot;incident_date&quot;:&quot;1111-01-01&quot;,&quot;content&quot;:&quot;qfewqd &quot;}', 'qwe');

-- --------------------------------------------------------

--
-- Table structure for table `segment_types`
--

CREATE TABLE `segment_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `segment_types`
--

INSERT INTO `segment_types` (`id`, `name`) VALUES
(1, 'reports'),
(2, 'games'),
(3, 'jokes');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `form_fields`
--
ALTER TABLE `form_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `segment_type_id` (`segment_type_id`);

--
-- Indexes for table `segments`
--
ALTER TABLE `segments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `segment_type_id` (`segment_type_id`);

--
-- Indexes for table `segment_types`
--
ALTER TABLE `segment_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `form_fields`
--
ALTER TABLE `form_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `segments`
--
ALTER TABLE `segments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `segment_types`
--
ALTER TABLE `segment_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `form_fields`
--
ALTER TABLE `form_fields`
  ADD CONSTRAINT `form_fields_ibfk_1` FOREIGN KEY (`segment_type_id`) REFERENCES `segment_types` (`id`);

--
-- Constraints for table `segments`
--
ALTER TABLE `segments`
  ADD CONSTRAINT `segments_ibfk_1` FOREIGN KEY (`segment_type_id`) REFERENCES `segment_types` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
