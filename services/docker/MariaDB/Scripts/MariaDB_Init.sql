USE 'smarttouch_db';

-- Dumping structure for table smarttouch_db.changelog
CREATE TABLE IF NOT EXISTS `changelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `editBy` varchar(50) DEFAULT NULL,
  `editDate` datetime NOT NULL,
  `tagPath` varchar(75) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `newValue` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `oldValue` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `itemType` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `location` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table smarttouch_db.recipe
CREATE TABLE IF NOT EXISTS `recipe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipeID` int(11) NOT NULL,
  `paramID` int(11) NOT NULL,
  `value` varchar(50) NOT NULL,
  `lastEditBy` varchar(50) DEFAULT NULL,
  `lastEditDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_paramID` (`paramID`),
  KEY `FK_recipe_recipeID` (`recipeID`),
  CONSTRAINT `FK_paramID` FOREIGN KEY (`paramID`) REFERENCES `recipe_paramdef` (`id`),
  CONSTRAINT `FK_recipe_recipeID` FOREIGN KEY (`recipeID`) REFERENCES `recipedef` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table smarttouch_db.recipedef
CREATE TABLE IF NOT EXISTS `recipedef` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `createdBy` varchar(50) DEFAULT NULL,
  `creationDate` datetime NOT NULL,
  `lastEditBy` varchar(50) DEFAULT NULL,
  `lastEditDate` datetime NOT NULL,
  `metric` bit(1) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `type` varchar(50) NOT NULL,
  `subCategory` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IX_recipeDef` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table smarttouch_db.recipe_changelog
CREATE TABLE IF NOT EXISTS `recipe_changelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemType` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `item` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `value` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `newValue` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `editBy` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `editDate` datetime NOT NULL,
  `recipeType` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table smarttouch_db.recipe_equipmentdef
CREATE TABLE IF NOT EXISTS `recipe_equipmentdef` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `plc` varchar(50) NOT NULL,
  `enabled` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table smarttouch_db.recipe_paramdef
CREATE TABLE IF NOT EXISTS `recipe_paramdef` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `equipmentId` int(11) NOT NULL,
  `name` char(50) NOT NULL,
  `dataType` char(4) NOT NULL,
  `UOM` char(10) NOT NULL,
  `subUDT1` varchar(70) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `subUDT2` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `subUDT3` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_EquipID` (`equipmentId`),
  CONSTRAINT `FK_EquipID` FOREIGN KEY (`equipmentId`) REFERENCES `recipe_equipmentdef` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table smarttouch_db.recipe_translations
CREATE TABLE IF NOT EXISTS `recipe_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paramID` int(11) NOT NULL,
  `Language` varchar(20) NOT NULL,
  `TranslatedText` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_translations_paramDef` (`paramID`),
  CONSTRAINT `FK_translations_paramDef` FOREIGN KEY (`paramID`) REFERENCES `recipe_paramdef` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table smarttouch_db.shift_data
CREATE TABLE IF NOT EXISTS `shift_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `shift` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table smarttouch_db.state_changes
CREATE TABLE IF NOT EXISTS `state_changes` (
  `state_changes_ndx` int(11) NOT NULL AUTO_INCREMENT,
  `blocked` tinyint(1) DEFAULT NULL,
  `faulted` tinyint(1) DEFAULT NULL,
  `jogging` tinyint(1) DEFAULT NULL,
  `paused` tinyint(1) DEFAULT NULL,
  `ready` tinyint(1) DEFAULT NULL,
  `running` tinyint(1) DEFAULT NULL,
  `starved` tinyint(1) DEFAULT NULL,
  `stopping` tinyint(1) DEFAULT NULL,
  `module_serial` varchar(255) DEFAULT NULL,
  `recipe` varchar(255) DEFAULT NULL,
  `shift` int(11) NOT NULL,
  `shift_id` int(11) NOT NULL,
  `t_stamp` datetime DEFAULT NULL,
  `shift_change` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`state_changes_ndx`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table smarttouch_db.stop_history
CREATE TABLE IF NOT EXISTS `stop_history` (
  `stop_event_id` varchar(255) DEFAULT NULL,
  `downtime_start` datetime DEFAULT NULL,
  `downtime_end` datetime DEFAULT NULL,
  `stop_duration` int(11) DEFAULT NULL,
  `first_fault` varchar(255) DEFAULT NULL,
  `first_fault_id` varchar(255) DEFAULT NULL,
  `first_fault_path` varchar(255) DEFAULT NULL,
  `first_fault_time` datetime DEFAULT NULL,
  `shift` smallint(6) DEFAULT NULL,
  `recipeName` varchar(150) DEFAULT NULL,
  `machSpeed` float DEFAULT NULL,
  `category` smallint(6) DEFAULT NULL,
  `first_fault_num` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table smarttouch_db.tissue_production_data
CREATE TABLE IF NOT EXISTS `tissue_production_data` (
  `t_stamp` datetime NOT NULL,
  `module_serial` varchar(55) NOT NULL,
  `shift` int(11) NOT NULL,
  `shift_id` int(11) NOT NULL,
  `output` decimal(18,2) NOT NULL,
  `waste` decimal(18,2) NOT NULL,
  `production_units` varchar(55) NOT NULL,
  PRIMARY KEY (`t_stamp`,`module_serial`,`shift`,`shift_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.