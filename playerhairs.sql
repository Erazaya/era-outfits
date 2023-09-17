CREATE TABLE IF NOT EXISTS `playershair` (
  `citizenid` varchar(50) NOT NULL,
  `basehair` int(11) NOT NULL DEFAULT 0,
  `althair` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
