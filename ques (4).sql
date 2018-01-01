-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2017 at 04:40 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ques`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `inse` (IN `id` INT(5), IN `username` VARCHAR(100), IN `password` VARCHAR(30))  MODIFIES SQL DATA
INSERT INTO login VALUES(id,username,password)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `current_affairs_scores`
-- (See below for the actual view)
--
CREATE TABLE `current_affairs_scores` (
`username` varchar(100)
,`score` int(5)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `leaderboard`
-- (See below for the actual view)
--
CREATE TABLE `leaderboard` (
`category` varchar(30)
,`username` varchar(100)
,`score` int(5)
);

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `username` varchar(100) NOT NULL,
  `levelname` varchar(100) NOT NULL,
  `exp` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`username`, `levelname`, `exp`) VALUES
('Nithin', 'Beginner', 729),
('Raghav', 'Apprentice', 5567);

--
-- Triggers `level`
--
DELIMITER $$
CREATE TRIGGER `lvlup` BEFORE UPDATE ON `level` FOR EACH ROW IF new.exp>5000 AND new.exp<20000 THEN SET new.levelname='Apprentice';
ELSEIF new.exp>20000 THEN SET new.levelname='Expert';
END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(3) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `username`, `password`) VALUES
(0, 'Aishwarya', 'quiz'),
(0, 'Nithin', 'quiz'),
(0, 'Raghav', 'quiz');

-- --------------------------------------------------------

--
-- Stand-in structure for view `popularity`
-- (See below for the actual view)
--
CREATE TABLE `popularity` (
`category` varchar(30)
,`cnt` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `ques`
--

CREATE TABLE `ques` (
  `id` int(11) NOT NULL,
  `category` varchar(30) NOT NULL,
  `questions` varchar(255) NOT NULL,
  `option1` varchar(30) NOT NULL,
  `option2` varchar(30) NOT NULL,
  `option3` varchar(30) NOT NULL,
  `option4` varchar(30) NOT NULL,
  `answer` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ques`
--

INSERT INTO `ques` (`id`, `category`, `questions`, `option1`, `option2`, `option3`, `option4`, `answer`) VALUES
(1, 'Entertainment', 'What is the name of Jon Snow\'s sword?', 'Longclaw', 'Dawn', 'Moonlight', 'Wolfjaw', 'Longclaw'),
(2, 'Entertainment', 'Who is the father of Ned Stark?', 'Ben Stark', 'Rickard Stark', 'Brandon Stark', 'Torrhen Stark', 'Rickard Stark'),
(3, 'Entertainment', 'Where did Robert defeat Rhaegar?', 'Ashford', 'Kings Landing', 'Blackwater Bay', 'Trident', 'Trident'),
(4, 'Entertainment', 'Who is known as the Sword of the Morning?', 'Ser Arthur Dayne', 'Ser Barriston Selmy', 'Ser Jaimie Lannister', 'Ser Berric Dondarrion', 'Ser Arthur Dayne'),
(5, 'Entertainment', 'Where was Jon Snow Born', 'Winterfell', 'Ashford', 'Tower of Joy', 'Kings Landing', 'Tower of Joy'),
(6, 'Entertainment', 'Who was called as The King Beyond The Wall?', 'Mance Raydar', 'Tormund', 'Castar', 'Qhorin Halfhand', 'Mance Raydar'),
(7, 'Entertainment', 'Which was the only kindom which Aegon the conqueror couldn\'t defeat?', 'Dorne', 'Highgarden', 'Casterly Rock', 'The North', 'Dorne'),
(8, 'History', 'Who is known as the Father of Communism?', 'Stalin', 'Lenin', 'Karl Marx', 'Gorbachev', 'Karl Marx'),
(9, 'History', 'When did USA get its Independence?', '1776', '1789', '1802', '1792', '1776'),
(10, 'History', 'Who was the first British Governor General in India?', 'Mount Batten', 'Robert Clive', 'Dalhousie', 'Simon', 'Robert Clive'),
(11, 'History', 'Where did Japan attack USA during the second World War?', 'New York', 'New Jersey', 'Florida', 'Pearl Harbour', 'Pearl Harbour'),
(12, 'History', 'When did the Second World War end?', '1927', '1941', '1945', '1947', '1945'),
(13, 'History', 'When was North Korea Formed?', '1950', '1951', '1953', '1954', '1954'),
(14, 'History', 'Which President ordered the bombing of Hiroshima and Nagasaki?', 'Kennedy', 'Eisenhover', 'Lincoln', 'Rosevelt', 'Eisenhover'),
(31, 'Sports', 'Which county did Ravi Shastri play for?', 'Glamorgan', 'Leicestershire', 'Gloucestershire', 'Lancashire', 'Glamorgan'),
(32, 'Sports', 'Who was the first Indian to win the World Amateur Billiards title?', 'Geet Sethi', 'Wilson Jones', 'Michael Ferreira', 'Manoj Kothari', 'Wilson Jones'),
(33, 'Sports', 'Who is the first Indian woman to win an Asian Games gold in 400m run?', 'M.L.Valsamma', 'P.T.Usha', 'Kamaljit Sandhu', 'K.Malleshwari', 'Kamaljit Sandhu'),
(34, 'Sports', 'When was Amateur Athletics Federation of India established?', '1936', '1946', '1956', '1966', '1946'),
(35, 'Sports', 'India won its first olympic hockey gold in?', '1928', '1932', '1936', '1948', '1928'),
(36, 'Sports', 'Who was the 1st ODI captain for India?', 'Ajit Wadekar', 'Bishen Singh Bedi', 'Mansur Ali Khan', 'Vinoo Mankad', 'Ajit Wadekar'),
(37, 'Sports', 'Where did India play its 1st one day international match?', 'Lords', 'Headingley', 'Taunton', 'The Oval', 'Headingley'),
(38, 'Sports', 'India reached the final of the Davis Cup for the first time in...?', '1964', '1966', '1970', '1974', '1966'),
(39, 'Sports', 'The Dronacharya Award is given to...?', 'Sportsmen', 'Coaches', 'Umpires', 'Sports Editors', 'Coaches'),
(40, 'Sports', 'In which Indian state did the game of Polo originate?', 'Meghalaya', 'Rajasthan', 'Manipur', 'West Bengal', 'Manipur'),
(41, 'Sports', 'The Indian football team made its first appearance at Olympics in...?', '1936', '1948', '1952', '1956', '1948'),
(42, 'Sports', 'The first international cricket match was played between these two countries-', 'England and India', 'England and Australia', 'Australia and Wales', 'Canada and USA', 'Canada and USA'),
(43, 'Science', 'Washing soda is the common name for', 'Sodium carbonate', 'Calcium bicarbonate', 'Sodium bicarbonate', 'Calcium carbonate', 'Sodium carbonate'),
(44, 'Science', 'Quartz crystals normally used in quartz clocks etc. is chemically', 'Silicon dioxide', 'Germanium oxide', 'Silicon', 'Sodium silicate', 'Silicon dioxide'),
(45, 'Science', 'Light year is a unit of', 'Light', 'Time', 'Distance', 'Intensity', 'Distance'),
(46, 'Science', 'Light from the Sun reaches us in nearly', 'Two minutes', 'Five Minutes', 'Eight Minutes', 'Four Minutes', 'Eight Minutes'),
(47, 'Science', 'Photosynthesis takes place faster in', 'Yellow light', 'White light', 'Red light', 'Darkness', 'White light'),
(48, 'Science', 'Which of the following is a protein?', 'Natural rubber', 'Starch', 'Cellulose', 'None of these', 'Natural rubber'),
(49, 'Science', 'The National Chemical Laboratory is situated in', 'Delhi', 'Pune', 'Bangalore', 'Chennai', 'Pune'),
(50, 'Science', 'Which scientist discovered the radioactive element radium?', 'Isaac Newton', 'Albert Einstein', 'Benjamin Franklin', 'Marie Curie', 'Marie Curie'),
(51, 'Science', 'This device was invented by Zenith engineer Eugene Polley in 1955', 'Microwave oven', 'Remote control', 'VCR', 'Calculator', 'Remote control'),
(52, 'Science', 'Who first patented Dynamite?', 'J. R. Gluber', 'A. Nobel', 'G. Fawks', 'W. Bickford', 'A. Nobel'),
(54, 'Science', 'In which decade was the IEEE founded?', '1850s', '1880s', '1930s', '1950s', '1880s'),
(55, 'Science', 'Radiocarbon dating technique is used to estimate the age of', 'Rocks', 'Monuments', 'People', 'Fossils', 'Fossils'),
(56, 'Geography', 'The great victoria desert is located in', 'Canada', 'Africa', 'America', 'Australia', 'Australia'),
(57, 'Geography', 'The largest country in the world by geographical area is', 'Russia', 'China', 'India', 'Australia', 'Russia'),
(58, 'Geography', 'Sri Lanka was formerly known as', 'Ceylon', 'Sigiria', 'Tasmania', 'Jakarta', 'Ceylon'),
(59, 'Geography', 'The highest sand dunes are found in', 'Sahara Desert', 'Atacama Desert', 'Gobi Desert', 'Kalahari Desert', 'Sahara Desert'),
(60, 'Geography', 'The largest city in Latin America is', 'Mexico City', 'Caracas', 'Rio de Janeiro', 'Buenos Aires', 'Mexico City'),
(61, 'Geography', 'Which of the following is an inland sea?', 'Caribbean sea', 'Caspian sea', 'Red sea', 'Yellow sea', 'Caspian sea'),
(62, 'Geography', 'The river situated along the border between the USA and Mexico is', 'Rio Grande', 'Amazon', 'Mississippi', 'None of these', 'Rio Grande'),
(63, 'Geography', 'The river Jordan drains into the', 'Dead Sea', 'Gulf of Suez', 'Lake Michigan', 'None of These', 'Dead Sea'),
(64, 'Geography', 'The smallest country in the world is', 'Vatican City', 'Australia', 'Brazil', 'Italy', 'Vatican City'),
(65, 'Geography', 'The second largest continent in the world is', 'Asia', 'Africa', 'Australia', 'Europe', 'Africa'),
(66, 'Geography', 'The largest island in the world is', 'Greenland', 'Madagascar', 'Borneo', 'New Guinea', 'Greenland'),
(67, 'Geography', 'Which city is used as the reference point for 0 degrees of longitude?', 'Greenwich', 'London', 'New York', 'Paris', 'Greenwich'),
(68, 'History', 'The Battle of Plassey was fought in', '1757', '1764', '1857', '1748', '1757'),
(69, 'History', 'World War 1 commenced in', '1914', '1920', '1918', '1917', '1914'),
(70, 'History', 'Where was Napoleon sent in exile after the battle of waterloo ?', 'St. Helen', 'Corsica', 'Elba', 'Capri', 'St. Helen'),
(71, 'History', 'When did Vasco-da-Gama come to India ?', '1492', '1494', '1496', '1498', '1498'),
(72, 'History', 'Who was the founder of Indian National Congress ?', 'Anand Mohan Bose', 'W.C. Bannerji', 'A.O. Hume', 'William Adam', 'A.O. Hume'),
(73, 'Famous Personalities', 'Who is known as the father of Geometry?', 'Aristotle', 'Euclid', 'Pythagoras', 'Kepler', 'Euclid'),
(74, 'Famous Personalities', 'Who was known as The Iron Man of India?', 'Jawaharlal Nehru', 'Subhash Chandra Bose', 'Sardar Vallabhbhai Patel', 'None of these', 'Sardar Vallabhbhai Patel'),
(75, 'Famous Personalities', 'Jude Felix is a famous Indian player in which sport?', 'Volleyball', 'Tennis', 'Football', 'Hockey', 'Hockey'),
(76, 'Famous Personalities', 'Professor Amartya Sen is famous in which of the fields?', 'Biochemistry', 'Electronics', 'Economics', 'Geology', 'Economics'),
(77, 'Famous Personalities', 'R. K. Laxman is a renowned', 'Dance master', 'Writer', 'Cartoonist', 'Journalist', 'Cartoonist'),
(78, 'Famous Personalities', 'The first woman in space was', 'Valentina Tereshkova', 'Sally Ride', 'Naidia Comenci', 'Tamara Press', 'Valentina Tereshkova'),
(79, 'Famous Personalities', 'Who is the creator of the Rock Garden in Chandigarh?', 'Pupal Jayakar', 'Le Corbousier', 'Glen', 'Nek Chand', 'Nek Chand'),
(80, 'Famous Personalities', 'Raja Ravi Verma, was famous in which of the fields?', 'Painting', 'Politics', 'Dance', 'Music', 'Painting'),
(81, 'Famous Personalities', 'Who amongst the following is founder of Dropbox ?', 'Drew Houston', 'Jack Dorsey', 'Brian Chesky', 'Evan Spiegel', 'Drew Houston'),
(82, 'Famous Personalities', 'Who is known as the father of Genetics?', 'Charles Darwin', 'Louis Pasteur', 'Hugo De vries', 'Gregor Mendel', 'Gregor Mendel'),
(83, 'Famous Personalities', 'Which of the following was Satyajit Ray associated with?', 'Classical music', 'Commercial art', 'Film Direction', 'Classical dance', 'Film Direction'),
(84, 'Famous Personalities', 'Who is known as the founder of WikiLeaks?', 'Julian Assange', 'Mark Zuckerberg', 'Jeff Bezos', 'None of these', 'Julian Assange'),
(85, 'Current Affairs', 'Who will be the new US Ambassador to India?', 'Mark Warner', 'David Friedman', 'Kenneth Juster', 'Richard Verma', 'Kenneth Juster'),
(86, 'Current Affairs', 'Who has been chosen for the 53rd Jnanpith Award?', 'Krishna Sobti', 'Leeladhar Mandloi', 'Ramakant Rath', 'Girishwar Misra', 'Krishna Sobti'),
(87, 'Current Affairs', 'Which country is hosting the 2017 World Youth Forum (WYF)?', 'Egypt', 'India', 'USA', 'Australia', 'Egypt'),
(88, 'Current Affairs', 'Who has been elected as the 95th Prime Minister of Japan?', 'Tadamori Oshima', 'Shinzo Abe', 'Hirotaka Akamatsu', 'Junichiro Koizumi', 'Shinzo Abe'),
(89, 'Current Affairs', 'Which state will host the 36th edition of National Games of India in 2018?', 'Karnataka', 'Kerala', 'Goa', 'Assam', 'Goa'),
(90, 'Current Affairs', 'Which country won the 2017 FIFA Under-17 World Cup?', 'England', 'Spain', 'France', 'India', 'England'),
(91, 'Current Affairs', 'Who won the 2017 Man Booker Prize?', 'George Saunders', 'Zadie Smith', 'Sebastian Barry', 'Colin Thubron', 'George Saunders'),
(92, 'Current Affairs', 'Which company has tied up with textile ministry to promote handloom industry?', 'Myntra', 'HomeShop18', 'Amazon', 'None of these', 'Myntra'),
(93, 'Current Affairs', 'Who will be the new Director-General of UNESCO?', 'Audrey Azoulay', 'Hamad Kawari', 'Fleur Pellerin', 'Irina Bokova', 'Audrey Azoulay'),
(94, 'Current Affairs', 'Who has been appointed as the new ambassador of India to China?', 'Vijay Keshav Gokhale', 'Ajay Bisaria', 'K P Prasad', 'Gautam Bambawale', 'Gautam Bambawale'),
(95, 'Current Affairs', 'Who won the 2017 China Open Tennis tournament?', 'Roger Federer', 'Nick Kyrgios', 'Rafael Nadal', 'Novak Djokovic', 'Rafael Nadal'),
(96, 'Current Affairs', 'The first electric bus service in India launched in which state?', 'Himachal Pradesh', 'Uttar Pradesh', 'Karnataka', 'Kerala', 'Himachal Pradesh'),
(97, 'Entertainment', 'What new 2017 TV sitcom is a spin-off prequel to The Big Bang Theory?', 'Young Howard', 'Young Raj', 'Young Sheldon', 'Young Penny', 'Young Sheldon'),
(98, 'Entertainment', 'What is the name of the van on the show Scooby Doo?', 'Ecto', 'Mystery Machine', 'Scooby Van', 'The Case Closer', 'Mystery Machine'),
(99, 'Entertainment', 'What is the last name of Chandler in the show Friends?', 'Bing', 'Ming', 'Sanders', 'None of these', 'Bing'),
(100, 'Entertainment', 'Which musician won the Nobel Prize for Literature in 2016?', 'John Lennon', 'Paul McCartney', 'Bob Dylan', 'None of these', 'Bob Dylan'),
(101, 'Entertainment', 'How old was Michael Jackson when he died?', '42', '50', '60', '45', '50'),
(102, 'Movies', 'Leonardo DiCaprio won an Oscar in which year?', '2005', '2014', '2007', '2016', '2016'),
(103, 'Movies', 'BB-8 is a droid from which film?', 'Star Wars', 'Star Trek', 'Avengers', 'None of these', 'Star Wars'),
(104, 'Movies', 'Which year was the original Jurassic Park released?', '1992', '1993', '1995', '1997', '1993'),
(105, 'Movies', 'Who played the fictional anti hero Deadpool in the 2016 movie?', 'Paul Rudd', 'Chris Evans', 'Ryan Reynolds', 'None of these', 'Ryan Reynolds'),
(106, 'Movies', 'Who was the male lead in the 1996 summer blockbuster Independence Day?', 'Jaden Smith', 'Will Smith', 'Jeff Goldblum', 'None of these', 'Will Smith'),
(107, 'Movies', 'Which movie won the Academy Award for best picture in 2010?', 'Avatar', 'The Hurt Locker', 'Slumdog Millionaire', 'None of these', 'The Hurt Locker'),
(108, 'Movies', 'In which year were the Oscars first presented?', '1940', '1930', '1950', '1929', '1929'),
(109, 'Movies', 'In Inception, the spinning top is an example of a/an:', 'Totem', 'Hex', 'Lucky charm', 'None of these', 'Totem'),
(110, 'Movies', 'Harrison Ford Reprises his role as Rick Deckard in which 2017 science fiction film?', 'Blade Runner 2049', 'Flatliners', 'Alien Covenant', 'None of these', 'Blade Runner 2049'),
(111, 'Movies', 'Who directed the 2009 epic science fiction film Avatar?', 'Steven Spielberg', 'James Cameron', 'Ridley Scott', 'George Lucas', 'James Cameron'),
(112, 'Movies', 'The Wachowski Brothers are known for which science fiction film series?', 'Jurassic Park', 'Men in Black', 'Predators', 'The Matrix', 'The Matrix'),
(113, 'Movies', 'How many of the first six Star Wars films did George Lucas direct?', '6', '5', '4', '3', '4'),
(114, 'Technology', 'In which decade did the first transatlantic radio broadcast occur?', '1850s', '1860s', '1870s', '1900s', '1900s'),
(115, 'Technology', 'Who is a founder of Yahoo?', 'Dennis Ritchie', 'David Filo', 'Vint Cerf', 'Jeff Bezos', 'David Filo'),
(116, 'Technology', 'In which year was the MIDI(Musical Instrument Digital Interface) introduced?', '1987', '1983', '1973', '1977', '1983'),
(117, 'Technology', '.INI extension refers usually to what kind of file?', 'Image file', 'System file', 'Text file', 'Audio file', 'System file'),
(118, 'Technology', 'Who co-founded Hotmail in 1996 and then sold the company to Microsoft?', 'Shawn Fanning', 'Ada Byron Lovelace', 'Sabeer Bhatia', 'Ray Tomlinson', 'Sabeer Bhatia'),
(119, 'Technology', 'In the United States the television broadcast standard is', 'PAL', 'NTSC', 'SECAM', 'RGB', 'NTSC'),
(120, 'Technology', 'What was the first ARPANET message?', 'Lo', 'Hello world', 'Mary had a little lamb', 'Cyberspace, the final frontier', 'Lo'),
(121, 'Technology', 'Who co-created the UNIX operating system in 1969 with Dennis Ritchie?', 'Steve Wozniak', 'Ken Thompson', 'Bjarne Stroustrup', 'None of these', 'Ken Thompson'),
(122, 'Technology', 'What was the active medium used in the first working laser ever constructed?', 'A diamond block', 'Helium-neon gas', 'A ruby rod', 'Carbon dioxide gas', 'A ruby rod'),
(123, 'Technology', 'In which decade was the telegraph invented?', '1810s', '1840s', '1870s', '1890s', '1840s'),
(124, 'Technology', 'The first web server was built in:', 'Geneva', 'Berkeley', 'Cambridge', 'Birmingham', 'Geneva'),
(125, 'Technology', 'The first popular graphical web browser was:', 'Netscape', 'Veronica', 'Mosaic', 'Explorer', 'Mosaic');

-- --------------------------------------------------------

--
-- Table structure for table `userstats`
--

CREATE TABLE `userstats` (
  `id` int(5) NOT NULL,
  `username` varchar(100) NOT NULL,
  `category` varchar(30) NOT NULL,
  `score` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userstats`
--

INSERT INTO `userstats` (`id`, `username`, `category`, `score`) VALUES
(5363, 'Raghav', 'Sports', 490),
(5364, 'Raghav', 'Science', 542),
(5365, 'Raghav', 'Geography', 448),
(5366, 'Raghav', 'History', 573),
(5367, 'Raghav', 'Famous Personalities', 620),
(5368, 'Raghav', 'Current Affairs', 317),
(5369, 'Raghav', 'Entertainment', 811),
(5370, 'Raghav', 'Movies', 609),
(5371, 'Raghav', 'Technology', 485),
(5372, 'Raghav', 'History', 672),
(5373, 'Nithin', 'Sports', 729),
(5374, 'Nithin', 'Entertainment', 730),
(5375, 'Aishwarya', 'Entertainment', 840),
(5376, 'Raghav', 'Entertainment', 700),
(5377, 'Nithin', 'Entertainment', 640),
(5378, 'Aishwarya', 'Entertainment', 600);

-- --------------------------------------------------------

--
-- Structure for view `current_affairs_scores`
--
DROP TABLE IF EXISTS `current_affairs_scores`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `current_affairs_scores`  AS  select `userstats`.`username` AS `username`,`userstats`.`score` AS `score` from `userstats` where (`userstats`.`category` = 'Current Affairs') order by `userstats`.`score` desc ;

-- --------------------------------------------------------

--
-- Structure for view `leaderboard`
--
DROP TABLE IF EXISTS `leaderboard`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `leaderboard`  AS  select `userstats`.`category` AS `category`,`userstats`.`username` AS `username`,`userstats`.`score` AS `score` from `userstats` order by `userstats`.`score` desc WITH CASCADED CHECK OPTION ;

-- --------------------------------------------------------

--
-- Structure for view `popularity`
--
DROP TABLE IF EXISTS `popularity`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `popularity`  AS  select `userstats`.`category` AS `category`,count(`userstats`.`category`) AS `cnt` from `userstats` group by `userstats`.`category` order by count(`userstats`.`category`) desc ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `ques`
--
ALTER TABLE `ques`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userstats`
--
ALTER TABLE `userstats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ques`
--
ALTER TABLE `ques`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `userstats`
--
ALTER TABLE `userstats`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5379;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `userstats`
--
ALTER TABLE `userstats`
  ADD CONSTRAINT `userstats_ibfk_1` FOREIGN KEY (`username`) REFERENCES `login` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
