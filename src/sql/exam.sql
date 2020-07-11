/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50610
 Source Host           : localhost:3306
 Source Schema         : exam

 Target Server Type    : MySQL
 Target Server Version : 50610
 File Encoding         : 65001

 Date: 11/07/2020 14:56:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES (1, 'A1', '一教', '2020-01-01 07:00:00');
INSERT INTO `grade` VALUES (2, 'A2', '二教', '2020-01-02 08:00:00');
INSERT INTO `grade` VALUES (3, 'A3', '三机', '2020-01-10 12:00:00');
INSERT INTO `grade` VALUES (4, 'A4', '三教', '2020-05-01 07:30:00');
INSERT INTO `grade` VALUES (8, 'test1', 'test1', '2020-07-11 14:37:00');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `age` int(11) NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `home` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `g_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `student_ibfk_1`(`g_id`) USING BTREE,
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`g_id`) REFERENCES `grade` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, '张三', 18, '15122221112', '郑州', 1);
INSERT INTO `student` VALUES (2, '李四', 19, '15829392182', '洛阳', 1);
INSERT INTO `student` VALUES (3, '王五', 20, '15923239992', '南阳', 2);
INSERT INTO `student` VALUES (4, '韩六', 22, '13598929384', '北京', 2);
INSERT INTO `student` VALUES (5, '赵七', 20, '13922912231', '南京', 1);
INSERT INTO `student` VALUES (9, '阿狗', 18, '15122223333', '东北', 1);
INSERT INTO `student` VALUES (14, '2737110', 80, '15111111111', '123', 8);

SET FOREIGN_KEY_CHECKS = 1;
