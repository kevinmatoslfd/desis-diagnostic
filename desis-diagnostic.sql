/*
 Navicat Premium Data Transfer

 Source Server         : Local-Desis
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : desis-diagnostic

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 20/06/2023 20:56:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for candidatos
-- ----------------------------
DROP TABLE IF EXISTS `candidatos`;
CREATE TABLE `candidatos`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `candidato` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of candidatos
-- ----------------------------
INSERT INTO `candidatos` VALUES (1, 'Candidato 1', NULL);
INSERT INTO `candidatos` VALUES (2, 'Candidato 2', NULL);
INSERT INTO `candidatos` VALUES (3, 'Candidato 3', NULL);
INSERT INTO `candidatos` VALUES (4, 'Candidato 4', NULL);
INSERT INTO `candidatos` VALUES (5, 'Candidato 5', NULL);

-- ----------------------------
-- Table structure for comoenterarse
-- ----------------------------
DROP TABLE IF EXISTS `comoenterarse`;
CREATE TABLE `comoenterarse`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `como` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `short_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comoenterarse
-- ----------------------------
INSERT INTO `comoenterarse` VALUES (1, 'Web', 'web', NULL);
INSERT INTO `comoenterarse` VALUES (2, 'TV', 'tv', NULL);
INSERT INTO `comoenterarse` VALUES (3, 'Redes Sociales', 'redes', NULL);
INSERT INTO `comoenterarse` VALUES (4, 'Amigo', 'amigo', NULL);

-- ----------------------------
-- Table structure for comunas
-- ----------------------------
DROP TABLE IF EXISTS `comunas`;
CREATE TABLE `comunas`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `comuna` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `region_id` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `comunas_regiones`(`region_id`) USING BTREE,
  CONSTRAINT `comunas_regiones` FOREIGN KEY (`region_id`) REFERENCES `regiones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 372 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comunas
-- ----------------------------
INSERT INTO `comunas` VALUES (1, 'General Lagos', NULL, 1);
INSERT INTO `comunas` VALUES (2, 'Putre', NULL, 1);
INSERT INTO `comunas` VALUES (3, 'Arica', NULL, 1);
INSERT INTO `comunas` VALUES (4, 'Camarones', NULL, 1);
INSERT INTO `comunas` VALUES (5, 'Colchane', NULL, 2);
INSERT INTO `comunas` VALUES (8, 'Camiña', NULL, 2);
INSERT INTO `comunas` VALUES (9, 'Huara', NULL, 2);
INSERT INTO `comunas` VALUES (10, 'Iquique', NULL, 2);
INSERT INTO `comunas` VALUES (11, 'Pozo Almonte', NULL, 2);
INSERT INTO `comunas` VALUES (12, 'Alto Hospicio', NULL, 2);
INSERT INTO `comunas` VALUES (13, 'Pica', NULL, 2);
INSERT INTO `comunas` VALUES (14, 'Ollagüe', NULL, 3);
INSERT INTO `comunas` VALUES (15, 'Tocopilla', NULL, 3);
INSERT INTO `comunas` VALUES (16, 'María Elena', NULL, 3);
INSERT INTO `comunas` VALUES (17, 'Calama', NULL, 3);
INSERT INTO `comunas` VALUES (18, 'Sierra Gorda', NULL, 3);
INSERT INTO `comunas` VALUES (19, 'San Pedro de Atacama', NULL, 3);
INSERT INTO `comunas` VALUES (20, 'Mejillones', NULL, 3);
INSERT INTO `comunas` VALUES (21, 'Antofagasta', NULL, 3);
INSERT INTO `comunas` VALUES (22, 'Taltal', NULL, 3);
INSERT INTO `comunas` VALUES (23, 'Chañaral', NULL, 4);
INSERT INTO `comunas` VALUES (24, 'Diego de Almagro', NULL, 4);
INSERT INTO `comunas` VALUES (25, 'Caldera', NULL, 4);
INSERT INTO `comunas` VALUES (26, 'Copiapó', NULL, 4);
INSERT INTO `comunas` VALUES (27, 'Tierra Amarilla', NULL, 4);
INSERT INTO `comunas` VALUES (28, 'Huasco', NULL, 4);
INSERT INTO `comunas` VALUES (29, 'Freirina', NULL, 4);
INSERT INTO `comunas` VALUES (30, 'Vallenar', NULL, 4);
INSERT INTO `comunas` VALUES (31, 'Alto del Carmen', NULL, 4);
INSERT INTO `comunas` VALUES (32, 'La Higuera', NULL, 5);
INSERT INTO `comunas` VALUES (33, 'La Serena', NULL, 5);
INSERT INTO `comunas` VALUES (34, 'Coquimbo', NULL, 5);
INSERT INTO `comunas` VALUES (35, 'Vicuña', NULL, 5);
INSERT INTO `comunas` VALUES (36, 'Andacollo', NULL, 5);
INSERT INTO `comunas` VALUES (37, 'Paiguano', NULL, 5);
INSERT INTO `comunas` VALUES (38, 'Río Hurtado', NULL, 5);
INSERT INTO `comunas` VALUES (39, 'Ovalle', NULL, 5);
INSERT INTO `comunas` VALUES (40, 'Punitaqui', NULL, 5);
INSERT INTO `comunas` VALUES (41, 'Monte Patria', NULL, 5);
INSERT INTO `comunas` VALUES (42, 'Combarbalá', NULL, 5);
INSERT INTO `comunas` VALUES (43, 'Canela', NULL, 5);
INSERT INTO `comunas` VALUES (44, 'Illapel', NULL, 5);
INSERT INTO `comunas` VALUES (45, 'Salamanca', NULL, 5);
INSERT INTO `comunas` VALUES (46, 'Los Vilos', NULL, 5);
INSERT INTO `comunas` VALUES (47, 'Isla de Pascua', NULL, 6);
INSERT INTO `comunas` VALUES (49, 'Petorca', NULL, 6);
INSERT INTO `comunas` VALUES (50, 'Cabildo', NULL, 6);
INSERT INTO `comunas` VALUES (51, 'La Ligua', NULL, 6);
INSERT INTO `comunas` VALUES (52, 'Papudo', NULL, 6);
INSERT INTO `comunas` VALUES (53, 'Zapallar', NULL, 6);
INSERT INTO `comunas` VALUES (54, 'Putaendo', NULL, 6);
INSERT INTO `comunas` VALUES (55, 'Nogales', NULL, 6);
INSERT INTO `comunas` VALUES (56, 'San Esteban', NULL, 6);
INSERT INTO `comunas` VALUES (57, 'Catemu', NULL, 6);
INSERT INTO `comunas` VALUES (58, 'Santa María', NULL, 6);
INSERT INTO `comunas` VALUES (59, 'San Felipe', NULL, 6);
INSERT INTO `comunas` VALUES (61, 'Puchuncaví', NULL, 6);
INSERT INTO `comunas` VALUES (62, 'Calera', NULL, 6);
INSERT INTO `comunas` VALUES (63, 'Quintero', NULL, 6);
INSERT INTO `comunas` VALUES (64, 'Panquehue', NULL, 6);
INSERT INTO `comunas` VALUES (65, 'La Cruz', NULL, 6);
INSERT INTO `comunas` VALUES (66, 'Los Andes', NULL, 6);
INSERT INTO `comunas` VALUES (67, 'Hijuelas', NULL, 6);
INSERT INTO `comunas` VALUES (68, 'Rinconada', NULL, 6);
INSERT INTO `comunas` VALUES (69, 'Quillota', NULL, 6);
INSERT INTO `comunas` VALUES (70, 'Llaillay', NULL, 6);
INSERT INTO `comunas` VALUES (71, 'Concón', NULL, 6);
INSERT INTO `comunas` VALUES (72, 'Calle Larga', NULL, 6);
INSERT INTO `comunas` VALUES (73, 'Limache', NULL, 6);
INSERT INTO `comunas` VALUES (74, 'Olmué', NULL, 6);
INSERT INTO `comunas` VALUES (75, 'Villa Alemana', NULL, 6);
INSERT INTO `comunas` VALUES (76, 'Valparaíso', NULL, 6);
INSERT INTO `comunas` VALUES (77, 'Viña del Mar', NULL, 6);
INSERT INTO `comunas` VALUES (78, 'Quilpué', NULL, 6);
INSERT INTO `comunas` VALUES (79, 'Casablanca', NULL, 6);
INSERT INTO `comunas` VALUES (80, 'Algarrobo', NULL, 6);
INSERT INTO `comunas` VALUES (81, 'El Quisco', NULL, 6);
INSERT INTO `comunas` VALUES (82, 'El Tabo', NULL, 6);
INSERT INTO `comunas` VALUES (83, 'Cartagena', NULL, 6);
INSERT INTO `comunas` VALUES (84, 'San Antonio', NULL, 6);
INSERT INTO `comunas` VALUES (85, 'Juan Fernández', NULL, 6);
INSERT INTO `comunas` VALUES (86, 'Santo Domingo', NULL, 6);
INSERT INTO `comunas` VALUES (90, 'Tiltil', NULL, 7);
INSERT INTO `comunas` VALUES (91, 'Colina', NULL, 7);
INSERT INTO `comunas` VALUES (92, 'Lampa', NULL, 7);
INSERT INTO `comunas` VALUES (93, 'Lo Barnechea', NULL, 7);
INSERT INTO `comunas` VALUES (94, 'Quilicura', NULL, 7);
INSERT INTO `comunas` VALUES (95, 'Huechuraba', NULL, 7);
INSERT INTO `comunas` VALUES (96, 'Conchalí', NULL, 7);
INSERT INTO `comunas` VALUES (97, 'Vitacura', NULL, 7);
INSERT INTO `comunas` VALUES (98, 'Curacaví', NULL, 7);
INSERT INTO `comunas` VALUES (99, 'Renca', NULL, 7);
INSERT INTO `comunas` VALUES (100, 'Las Condes', NULL, 7);
INSERT INTO `comunas` VALUES (101, 'Recoleta', NULL, 7);
INSERT INTO `comunas` VALUES (102, 'Pudahuel', NULL, 7);
INSERT INTO `comunas` VALUES (103, 'Independencia', NULL, 7);
INSERT INTO `comunas` VALUES (104, 'Providencia', NULL, 7);
INSERT INTO `comunas` VALUES (105, 'Cerro Navia', NULL, 7);
INSERT INTO `comunas` VALUES (106, 'Quinta Normal', NULL, 7);
INSERT INTO `comunas` VALUES (107, 'Santiago Centro', NULL, 7);
INSERT INTO `comunas` VALUES (108, 'Lo Prado', NULL, 7);
INSERT INTO `comunas` VALUES (109, 'Estación Central', NULL, 7);
INSERT INTO `comunas` VALUES (110, 'La Reina', NULL, 7);
INSERT INTO `comunas` VALUES (111, 'Ñuñoa', NULL, 7);
INSERT INTO `comunas` VALUES (112, 'Pedro Aguirre Cerda', NULL, 7);
INSERT INTO `comunas` VALUES (113, 'Peñalolén', NULL, 7);
INSERT INTO `comunas` VALUES (114, 'Macul', NULL, 7);
INSERT INTO `comunas` VALUES (115, 'San Joaquín', NULL, 7);
INSERT INTO `comunas` VALUES (116, 'Cerrillos', NULL, 7);
INSERT INTO `comunas` VALUES (117, 'San Miguel', NULL, 7);
INSERT INTO `comunas` VALUES (118, 'María Pinto', NULL, 7);
INSERT INTO `comunas` VALUES (119, 'Maipú', NULL, 7);
INSERT INTO `comunas` VALUES (120, 'La Florida', NULL, 7);
INSERT INTO `comunas` VALUES (121, 'Lo Espejo', NULL, 7);
INSERT INTO `comunas` VALUES (122, 'San Ramón', NULL, 7);
INSERT INTO `comunas` VALUES (123, 'La Granja', NULL, 7);
INSERT INTO `comunas` VALUES (124, 'La Cisterna', NULL, 7);
INSERT INTO `comunas` VALUES (125, 'El Bosque', NULL, 7);
INSERT INTO `comunas` VALUES (126, 'Padre Hurtado', NULL, 7);
INSERT INTO `comunas` VALUES (127, 'La Pintana', NULL, 7);
INSERT INTO `comunas` VALUES (128, 'San Bernardo', NULL, 7);
INSERT INTO `comunas` VALUES (129, 'Puente Alto', NULL, 7);
INSERT INTO `comunas` VALUES (130, 'Peñaflor', NULL, 7);
INSERT INTO `comunas` VALUES (131, 'Calera de Tango', NULL, 7);
INSERT INTO `comunas` VALUES (132, 'Talagante', NULL, 7);
INSERT INTO `comunas` VALUES (133, 'El Monte', NULL, 7);
INSERT INTO `comunas` VALUES (134, 'Melipilla', NULL, 7);
INSERT INTO `comunas` VALUES (135, 'San José de Maipo', NULL, 7);
INSERT INTO `comunas` VALUES (136, 'Pirque', NULL, 7);
INSERT INTO `comunas` VALUES (137, 'Isla de Maipo', NULL, 7);
INSERT INTO `comunas` VALUES (138, 'Buin', NULL, 7);
INSERT INTO `comunas` VALUES (139, 'Paine', NULL, 7);
INSERT INTO `comunas` VALUES (140, 'San Pedro', NULL, 7);
INSERT INTO `comunas` VALUES (141, 'Alhué', NULL, 7);
INSERT INTO `comunas` VALUES (143, 'Mostazal', NULL, 8);
INSERT INTO `comunas` VALUES (144, 'Navidad', NULL, 8);
INSERT INTO `comunas` VALUES (145, 'Codegua', NULL, 8);
INSERT INTO `comunas` VALUES (146, 'Graneros', NULL, 8);
INSERT INTO `comunas` VALUES (147, 'Litueche', NULL, 8);
INSERT INTO `comunas` VALUES (148, 'Rancagua', NULL, 8);
INSERT INTO `comunas` VALUES (149, 'Doñihue', NULL, 8);
INSERT INTO `comunas` VALUES (150, 'La Estrella', NULL, 8);
INSERT INTO `comunas` VALUES (151, 'Olivar', NULL, 8);
INSERT INTO `comunas` VALUES (152, 'Coltauco', NULL, 8);
INSERT INTO `comunas` VALUES (153, 'Coinco', NULL, 8);
INSERT INTO `comunas` VALUES (154, 'Machalí', NULL, 8);
INSERT INTO `comunas` VALUES (155, 'Las Cabras', NULL, 8);
INSERT INTO `comunas` VALUES (156, 'Requínoa', NULL, 8);
INSERT INTO `comunas` VALUES (157, 'Quinta de Tilcoco', NULL, 8);
INSERT INTO `comunas` VALUES (158, 'Pichidegua', NULL, 8);
INSERT INTO `comunas` VALUES (159, 'Peumo', NULL, 8);
INSERT INTO `comunas` VALUES (160, 'Pichilemu', NULL, 8);
INSERT INTO `comunas` VALUES (161, 'Marchihue', NULL, 8);
INSERT INTO `comunas` VALUES (162, 'Rengo', NULL, 8);
INSERT INTO `comunas` VALUES (163, 'San Vicente', NULL, 8);
INSERT INTO `comunas` VALUES (164, 'Malloa', NULL, 8);
INSERT INTO `comunas` VALUES (165, 'Peralillo', NULL, 8);
INSERT INTO `comunas` VALUES (166, 'San Fernando', NULL, 8);
INSERT INTO `comunas` VALUES (167, 'Palmilla', NULL, 8);
INSERT INTO `comunas` VALUES (168, 'Pumanque', NULL, 8);
INSERT INTO `comunas` VALUES (169, 'Placilla', NULL, 8);
INSERT INTO `comunas` VALUES (170, 'Santa Cruz', NULL, 8);
INSERT INTO `comunas` VALUES (171, 'Nancagua', NULL, 8);
INSERT INTO `comunas` VALUES (172, 'Paredones', NULL, 8);
INSERT INTO `comunas` VALUES (173, 'Chépica', NULL, 8);
INSERT INTO `comunas` VALUES (174, 'Chimbarongo', NULL, 8);
INSERT INTO `comunas` VALUES (175, 'Lolol', NULL, 8);
INSERT INTO `comunas` VALUES (178, 'Vichuquén', NULL, 9);
INSERT INTO `comunas` VALUES (179, 'Teno', NULL, 9);
INSERT INTO `comunas` VALUES (180, 'Rauco', NULL, 9);
INSERT INTO `comunas` VALUES (181, 'Licantén', NULL, 9);
INSERT INTO `comunas` VALUES (182, 'Romeral', NULL, 9);
INSERT INTO `comunas` VALUES (183, 'Curicó', NULL, 9);
INSERT INTO `comunas` VALUES (184, 'Hualañé', NULL, 9);
INSERT INTO `comunas` VALUES (185, 'Sagrada Familia', NULL, 9);
INSERT INTO `comunas` VALUES (186, 'Molina', NULL, 9);
INSERT INTO `comunas` VALUES (187, 'Curepto', NULL, 9);
INSERT INTO `comunas` VALUES (188, 'Río Claro', NULL, 9);
INSERT INTO `comunas` VALUES (189, 'San Rafael', NULL, 9);
INSERT INTO `comunas` VALUES (190, 'Pencahue', NULL, 9);
INSERT INTO `comunas` VALUES (191, 'Constitución', NULL, 9);
INSERT INTO `comunas` VALUES (192, 'Pelarco', NULL, 9);
INSERT INTO `comunas` VALUES (193, 'Talca', NULL, 9);
INSERT INTO `comunas` VALUES (194, 'Maule', NULL, 9);
INSERT INTO `comunas` VALUES (195, 'San Clemente', NULL, 9);
INSERT INTO `comunas` VALUES (196, 'San Javier', NULL, 9);
INSERT INTO `comunas` VALUES (197, 'Empedrado', NULL, 9);
INSERT INTO `comunas` VALUES (198, 'Villa Alegre', NULL, 9);
INSERT INTO `comunas` VALUES (199, 'Yerbas Buenas', NULL, 9);
INSERT INTO `comunas` VALUES (200, 'Colbún', NULL, 9);
INSERT INTO `comunas` VALUES (201, 'Chanco', NULL, 9);
INSERT INTO `comunas` VALUES (204, 'Pelluhue', NULL, 9);
INSERT INTO `comunas` VALUES (205, 'Linares', NULL, 9);
INSERT INTO `comunas` VALUES (206, 'Longaví', NULL, 9);
INSERT INTO `comunas` VALUES (207, 'Cauquenes', NULL, 9);
INSERT INTO `comunas` VALUES (208, 'Retiro', NULL, 9);
INSERT INTO `comunas` VALUES (209, 'Parral', NULL, 9);
INSERT INTO `comunas` VALUES (212, 'Tomé', NULL, 10);
INSERT INTO `comunas` VALUES (213, 'Talcahuano', NULL, 10);
INSERT INTO `comunas` VALUES (214, 'Penco', NULL, 10);
INSERT INTO `comunas` VALUES (215, 'Hualpén', NULL, 10);
INSERT INTO `comunas` VALUES (216, 'Concepción', NULL, 10);
INSERT INTO `comunas` VALUES (217, 'Florida', NULL, 10);
INSERT INTO `comunas` VALUES (218, 'San Pedro de la Paz', NULL, 10);
INSERT INTO `comunas` VALUES (219, 'Chiguayante', NULL, 10);
INSERT INTO `comunas` VALUES (220, 'Hualqui', NULL, 10);
INSERT INTO `comunas` VALUES (221, 'Coronel', NULL, 10);
INSERT INTO `comunas` VALUES (222, 'Cabrero', NULL, 10);
INSERT INTO `comunas` VALUES (223, 'Lota', NULL, 10);
INSERT INTO `comunas` VALUES (224, 'Yumbel', NULL, 10);
INSERT INTO `comunas` VALUES (225, 'Santa Juana', NULL, 10);
INSERT INTO `comunas` VALUES (226, 'San Rosendo', NULL, 10);
INSERT INTO `comunas` VALUES (227, 'Arauco', NULL, 10);
INSERT INTO `comunas` VALUES (228, 'Laja', NULL, 10);
INSERT INTO `comunas` VALUES (229, 'Tucapel', NULL, 10);
INSERT INTO `comunas` VALUES (230, 'Antuco', NULL, 10);
INSERT INTO `comunas` VALUES (231, 'Quilleco', NULL, 10);
INSERT INTO `comunas` VALUES (232, 'Los Ángeles', NULL, 10);
INSERT INTO `comunas` VALUES (233, 'Curanilahue', NULL, 10);
INSERT INTO `comunas` VALUES (234, 'Nacimiento', NULL, 10);
INSERT INTO `comunas` VALUES (235, 'Negrete', NULL, 10);
INSERT INTO `comunas` VALUES (236, 'Lebu', NULL, 10);
INSERT INTO `comunas` VALUES (237, 'Santa Bárbara', NULL, 10);
INSERT INTO `comunas` VALUES (238, 'Los Álamos', NULL, 10);
INSERT INTO `comunas` VALUES (239, 'Quilaco', NULL, 10);
INSERT INTO `comunas` VALUES (240, 'Mulchén', NULL, 10);
INSERT INTO `comunas` VALUES (241, 'Cañete', NULL, 10);
INSERT INTO `comunas` VALUES (242, 'Alto Biobío', NULL, 10);
INSERT INTO `comunas` VALUES (243, 'Contulmo', NULL, 10);
INSERT INTO `comunas` VALUES (244, 'Tirúa', NULL, 10);
INSERT INTO `comunas` VALUES (245, 'Renaico', NULL, 11);
INSERT INTO `comunas` VALUES (248, 'Angol', NULL, 11);
INSERT INTO `comunas` VALUES (251, 'Collipulli', NULL, 11);
INSERT INTO `comunas` VALUES (252, 'Los Sauces', NULL, 11);
INSERT INTO `comunas` VALUES (253, 'Purén', NULL, 11);
INSERT INTO `comunas` VALUES (254, 'Ercilla', NULL, 11);
INSERT INTO `comunas` VALUES (255, 'Lumaco', NULL, 11);
INSERT INTO `comunas` VALUES (256, 'Victoria', NULL, 11);
INSERT INTO `comunas` VALUES (257, 'Traiguén', NULL, 11);
INSERT INTO `comunas` VALUES (258, 'Galvarino', NULL, 11);
INSERT INTO `comunas` VALUES (259, 'Perquenco', NULL, 11);
INSERT INTO `comunas` VALUES (260, 'Curacautín', NULL, 11);
INSERT INTO `comunas` VALUES (261, 'Lonquimay', NULL, 11);
INSERT INTO `comunas` VALUES (262, 'Lautaro', NULL, 11);
INSERT INTO `comunas` VALUES (263, 'Cholchol', NULL, 11);
INSERT INTO `comunas` VALUES (264, 'Vilcún', NULL, 11);
INSERT INTO `comunas` VALUES (265, 'Carahue', NULL, 11);
INSERT INTO `comunas` VALUES (266, 'Temuco', NULL, 11);
INSERT INTO `comunas` VALUES (267, 'Nueva Imperial', NULL, 11);
INSERT INTO `comunas` VALUES (268, 'Padre las Casas', NULL, 11);
INSERT INTO `comunas` VALUES (269, 'Saavedra', NULL, 11);
INSERT INTO `comunas` VALUES (270, 'Melipeuco', NULL, 11);
INSERT INTO `comunas` VALUES (271, 'Cunco', NULL, 11);
INSERT INTO `comunas` VALUES (272, 'Freire', NULL, 11);
INSERT INTO `comunas` VALUES (273, 'Pitrufquén', NULL, 11);
INSERT INTO `comunas` VALUES (274, 'Teodoro Schmidt', NULL, 11);
INSERT INTO `comunas` VALUES (275, 'Gorbea', NULL, 11);
INSERT INTO `comunas` VALUES (276, 'Toltén', NULL, 11);
INSERT INTO `comunas` VALUES (277, 'Villarrica', NULL, 11);
INSERT INTO `comunas` VALUES (278, 'Pucón', NULL, 11);
INSERT INTO `comunas` VALUES (279, 'Curarrehue', NULL, 11);
INSERT INTO `comunas` VALUES (281, 'Loncoche', NULL, 11);
INSERT INTO `comunas` VALUES (282, 'Lanco', NULL, 12);
INSERT INTO `comunas` VALUES (283, 'Mariquina', NULL, 12);
INSERT INTO `comunas` VALUES (284, 'Panguipulli', NULL, 12);
INSERT INTO `comunas` VALUES (285, 'Máfil', NULL, 12);
INSERT INTO `comunas` VALUES (286, 'Valdivia', NULL, 12);
INSERT INTO `comunas` VALUES (287, 'Los Lagos', NULL, 12);
INSERT INTO `comunas` VALUES (288, 'Corral', NULL, 12);
INSERT INTO `comunas` VALUES (289, 'Paillaco', NULL, 12);
INSERT INTO `comunas` VALUES (292, 'Futrono', NULL, 12);
INSERT INTO `comunas` VALUES (293, 'La Unión', NULL, 12);
INSERT INTO `comunas` VALUES (294, 'Lago Ranco', NULL, 12);
INSERT INTO `comunas` VALUES (295, 'Río Bueno', NULL, 12);
INSERT INTO `comunas` VALUES (296, 'San Pablo', NULL, 13);
INSERT INTO `comunas` VALUES (297, 'San Juan de la Costa', NULL, 13);
INSERT INTO `comunas` VALUES (298, 'Osorno', NULL, 13);
INSERT INTO `comunas` VALUES (299, 'Puyehue', NULL, 13);
INSERT INTO `comunas` VALUES (300, 'Río Negro', NULL, 13);
INSERT INTO `comunas` VALUES (301, 'Purranque', NULL, 13);
INSERT INTO `comunas` VALUES (302, 'Puerto Octay', NULL, 13);
INSERT INTO `comunas` VALUES (303, 'Frutillar', NULL, 13);
INSERT INTO `comunas` VALUES (305, 'Fresia', NULL, 13);
INSERT INTO `comunas` VALUES (306, 'Llanquihue', NULL, 13);
INSERT INTO `comunas` VALUES (307, 'Puerto Varas', NULL, 13);
INSERT INTO `comunas` VALUES (308, 'Los Muermos', NULL, 13);
INSERT INTO `comunas` VALUES (309, 'Puerto Montt', NULL, 13);
INSERT INTO `comunas` VALUES (310, 'Cochamó', NULL, 13);
INSERT INTO `comunas` VALUES (311, 'Maullín', NULL, 13);
INSERT INTO `comunas` VALUES (312, 'Calbuco', NULL, 13);
INSERT INTO `comunas` VALUES (313, 'Ancud', NULL, 13);
INSERT INTO `comunas` VALUES (314, 'Hualaihué', NULL, 13);
INSERT INTO `comunas` VALUES (315, 'Quemchi', NULL, 13);
INSERT INTO `comunas` VALUES (316, 'Dalcahue', NULL, 13);
INSERT INTO `comunas` VALUES (317, 'Curaco de Vélez', NULL, 13);
INSERT INTO `comunas` VALUES (318, 'Quinchao', NULL, 13);
INSERT INTO `comunas` VALUES (319, 'Castro', NULL, 13);
INSERT INTO `comunas` VALUES (320, 'Puqueldón', NULL, 13);
INSERT INTO `comunas` VALUES (321, 'Chonchi', NULL, 13);
INSERT INTO `comunas` VALUES (322, 'Queilén', NULL, 13);
INSERT INTO `comunas` VALUES (323, 'Chaitén', NULL, 13);
INSERT INTO `comunas` VALUES (324, 'Quellón', NULL, 13);
INSERT INTO `comunas` VALUES (325, 'Futaleufú', NULL, 13);
INSERT INTO `comunas` VALUES (326, 'Palena', NULL, 13);
INSERT INTO `comunas` VALUES (328, 'Guaitecas', NULL, 14);
INSERT INTO `comunas` VALUES (329, 'Lago Verde', NULL, 14);
INSERT INTO `comunas` VALUES (330, 'Cisnes', NULL, 14);
INSERT INTO `comunas` VALUES (331, 'Aysén', NULL, 14);
INSERT INTO `comunas` VALUES (332, 'Coihaique', NULL, 14);
INSERT INTO `comunas` VALUES (333, 'Río Ibáñez', NULL, 14);
INSERT INTO `comunas` VALUES (334, 'Chile Chico', NULL, 14);
INSERT INTO `comunas` VALUES (335, 'Cochrane', NULL, 14);
INSERT INTO `comunas` VALUES (336, 'Tortel', NULL, 14);
INSERT INTO `comunas` VALUES (337, 'O’Higgins', NULL, 14);
INSERT INTO `comunas` VALUES (338, 'Torres del Paine', NULL, 15);
INSERT INTO `comunas` VALUES (339, 'Natales', NULL, 15);
INSERT INTO `comunas` VALUES (340, 'Laguna Blanca', NULL, 15);
INSERT INTO `comunas` VALUES (341, 'San Gregorio', NULL, 15);
INSERT INTO `comunas` VALUES (342, 'Río Verde', NULL, 15);
INSERT INTO `comunas` VALUES (343, 'Primavera', NULL, 15);
INSERT INTO `comunas` VALUES (344, 'Punta Arenas', NULL, 15);
INSERT INTO `comunas` VALUES (345, 'Porvenir', NULL, 15);
INSERT INTO `comunas` VALUES (346, 'Timaukel', NULL, 15);
INSERT INTO `comunas` VALUES (347, 'Cabo de Hornos', NULL, 15);
INSERT INTO `comunas` VALUES (348, 'Antártica', NULL, 15);
INSERT INTO `comunas` VALUES (349, 'Cobquecura', NULL, 16);
INSERT INTO `comunas` VALUES (350, 'Quirihue', NULL, 16);
INSERT INTO `comunas` VALUES (351, 'Ñiquén', NULL, 16);
INSERT INTO `comunas` VALUES (354, 'Ninhue', NULL, 16);
INSERT INTO `comunas` VALUES (355, 'Treguaco', NULL, 16);
INSERT INTO `comunas` VALUES (356, 'San Carlos', NULL, 16);
INSERT INTO `comunas` VALUES (357, 'Coelemu', NULL, 16);
INSERT INTO `comunas` VALUES (358, 'San Nicolás', NULL, 16);
INSERT INTO `comunas` VALUES (359, 'Portezuelo', NULL, 16);
INSERT INTO `comunas` VALUES (360, 'San Fabián', NULL, 16);
INSERT INTO `comunas` VALUES (361, 'Chillán', NULL, 16);
INSERT INTO `comunas` VALUES (362, 'Coihueco', NULL, 16);
INSERT INTO `comunas` VALUES (363, 'Chillán Viejo', NULL, 16);
INSERT INTO `comunas` VALUES (364, 'Ránquil', NULL, 16);
INSERT INTO `comunas` VALUES (365, 'Pinto', NULL, 16);
INSERT INTO `comunas` VALUES (366, 'Quillón', NULL, 16);
INSERT INTO `comunas` VALUES (367, 'Bulnes', NULL, 16);
INSERT INTO `comunas` VALUES (368, 'San Ignacio', NULL, 16);
INSERT INTO `comunas` VALUES (369, 'El Carmen', NULL, 16);
INSERT INTO `comunas` VALUES (370, 'Pemuco', NULL, 16);
INSERT INTO `comunas` VALUES (371, 'Yungay', NULL, 16);

-- ----------------------------
-- Table structure for regiones
-- ----------------------------
DROP TABLE IF EXISTS `regiones`;
CREATE TABLE `regiones`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `region` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of regiones
-- ----------------------------
INSERT INTO `regiones` VALUES (1, 'Arica y Parinacota', NULL);
INSERT INTO `regiones` VALUES (2, 'Tarapacá', NULL);
INSERT INTO `regiones` VALUES (3, 'Antofagasta', NULL);
INSERT INTO `regiones` VALUES (4, 'Atacama', NULL);
INSERT INTO `regiones` VALUES (5, 'Coquimbo', NULL);
INSERT INTO `regiones` VALUES (6, 'Valparaíso', NULL);
INSERT INTO `regiones` VALUES (7, 'Región Metropolitana de Santiago', NULL);
INSERT INTO `regiones` VALUES (8, 'Región del Libertador Gral. Bernardo O’Higgins \r', NULL);
INSERT INTO `regiones` VALUES (9, 'Región del Maule', NULL);
INSERT INTO `regiones` VALUES (10, 'Región del Biobío', NULL);
INSERT INTO `regiones` VALUES (11, 'Región de la Araucanía', NULL);
INSERT INTO `regiones` VALUES (12, 'Región de Los Ríos', NULL);
INSERT INTO `regiones` VALUES (13, 'Región de Los Lagos', NULL);
INSERT INTO `regiones` VALUES (14, 'Región Aisén del Gral. Carlos Ibáñez del Campo', NULL);
INSERT INTO `regiones` VALUES (15, 'Región de Magallanes y de la Antártica Chilena', NULL);
INSERT INTO `regiones` VALUES (16, 'Ñuble', NULL);

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre_apellido` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `rut` varchar(11) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `rut`(`rut`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usuarios
-- ----------------------------

-- ----------------------------
-- Table structure for votacion_candidato
-- ----------------------------
DROP TABLE IF EXISTS `votacion_candidato`;
CREATE TABLE `votacion_candidato`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `votacion_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `candidato_id` int(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `votacioncandidato_candidato`(`candidato_id`) USING BTREE,
  INDEX `votacioncandidato_votacion`(`votacion_id`) USING BTREE,
  CONSTRAINT `votacioncandidato_candidato` FOREIGN KEY (`candidato_id`) REFERENCES `candidatos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `votacioncandidato_votacion` FOREIGN KEY (`votacion_id`) REFERENCES `votaciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of votacion_candidato
-- ----------------------------
INSERT INTO `votacion_candidato` VALUES (1, 1, 1);
INSERT INTO `votacion_candidato` VALUES (2, 1, 2);
INSERT INTO `votacion_candidato` VALUES (3, 1, 3);
INSERT INTO `votacion_candidato` VALUES (4, 1, 4);
INSERT INTO `votacion_candidato` VALUES (5, 1, 5);

-- ----------------------------
-- Table structure for votaciones
-- ----------------------------
DROP TABLE IF EXISTS `votaciones`;
CREATE TABLE `votaciones`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `votacion` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of votaciones
-- ----------------------------
INSERT INTO `votaciones` VALUES (1, 'Elección candidatos periodo 2023-06', NULL);
INSERT INTO `votaciones` VALUES (2, 'Elección auxiliar inactiva', NULL);

-- ----------------------------
-- Table structure for votos
-- ----------------------------
DROP TABLE IF EXISTS `votos`;
CREATE TABLE `votos`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `usuario_rut` varchar(11) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `votacion_id` int(10) UNSIGNED NOT NULL,
  `candidato_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `votacion_id_index`(`votacion_id`) USING BTREE,
  INDEX `rut_index`(`usuario_rut`) USING BTREE,
  INDEX `votos_candidatos`(`candidato_id`) USING BTREE,
  CONSTRAINT `votos_candidatos` FOREIGN KEY (`candidato_id`) REFERENCES `candidatos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `votos_usuario` FOREIGN KEY (`usuario_rut`) REFERENCES `usuarios` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `votos_votaciones` FOREIGN KEY (`votacion_id`) REFERENCES `votaciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of votos
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
