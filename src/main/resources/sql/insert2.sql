INSERT INTO `rent_ap2`.`authority` (`id_authority`, `authority`) VALUES (1, 'role_admin');
INSERT INTO `rent_ap2`.`authority` (`id_authority`, `authority`) VALUES (2, 'role_user');
INSERT INTO `rent_ap2`.`authority` (`id_authority`, `authority`) VALUES (3, 'role_anonymous');

INSERT INTO `rent_ap2`.`area` (`id_area`, `name`) VALUES (1, 'Заводской');
INSERT INTO `rent_ap2`.`area` (`id_area`, `name`) VALUES (2, 'Ленинский');
INSERT INTO `rent_ap2`.`area` (`id_area`, `name`) VALUES (3, 'Московский');
INSERT INTO `rent_ap2`.`area` (`id_area`, `name`) VALUES (4, 'Октябрьский');
INSERT INTO `rent_ap2`.`area` (`id_area`, `name`) VALUES (5, 'Партизанский');
INSERT INTO `rent_ap2`.`area` (`id_area`, `name`) VALUES (6, 'Первомайский');
INSERT INTO `rent_ap2`.`area` (`id_area`, `name`) VALUES (7, 'Советский');
INSERT INTO `rent_ap2`.`area` (`id_area`, `name`) VALUES (8, 'Фрунзенский');
INSERT INTO `rent_ap2`.`area` (`id_area`, `name`) VALUES (9, 'Центральный');

INSERT INTO `rent_ap2`.`flat_status` (`id_flat_status`, `type`) VALUES (1, 'на рынке');
INSERT INTO `rent_ap2`.`flat_status` (`id_flat_status`, `type`) VALUES (2, 'в обрарботке');
INSERT INTO `rent_ap2`.`flat_status` (`id_flat_status`, `type`) VALUES (3, 'арендована');
INSERT INTO `rent_ap2`.`flat_status` (`id_flat_status`, `type`) VALUES (4, 'продана');

INSERT INTO `rent_ap2`.`subway`(`id_subway`, `name`) VALUES (1, 'Пушкинская');
INSERT INTO `rent_ap2`.`subway`(`id_subway`, `name`) VALUES (2, 'Борисовский тракт');
INSERT INTO `rent_ap2`.`subway`(`id_subway`, `name`) VALUES (3, 'Восток');
INSERT INTO `rent_ap2`.`subway`(`id_subway`, `name`) VALUES (4, 'Московская');
INSERT INTO `rent_ap2`.`subway`(`id_subway`, `name`) VALUES (5, 'Парк Челюскинцев');
INSERT INTO `rent_ap2`.`subway`(`id_subway`, `name`) VALUES (6, 'Академия наук');
INSERT INTO `rent_ap2`.`subway`(`id_subway`, `name`) VALUES (7, 'Площадь Якуба Коласа');
INSERT INTO `rent_ap2`.`subway`(`id_subway`, `name`) VALUES (8, 'Площадь Победы');
INSERT INTO `rent_ap2`.`subway`(`id_subway`, `name`) VALUES (9, 'Октябрьская');
INSERT INTO `rent_ap2`.`subway`(`id_subway`, `name`) VALUES (10, 'Институт Культуры');
INSERT INTO `rent_ap2`.`subway`(`id_subway`, `name`) VALUES (11, 'Грушевка');
INSERT INTO `rent_ap2`.`subway`(`id_subway`, `name`) VALUES (12, 'Михалово');
INSERT INTO `rent_ap2`.`subway`(`id_subway`, `name`) VALUES (13, 'Петровщина');
INSERT INTO `rent_ap2`.`subway`(`id_subway`, `name`) VALUES (14, 'Малиновка');
INSERT INTO `rent_ap2`.`subway`(`id_subway`, `name`) VALUES (15, 'Каменная Горка');
INSERT INTO `rent_ap2`.`subway`(`id_subway`, `name`) VALUES (16, 'Кунцевщина');
INSERT INTO `rent_ap2`.`subway`(`id_subway`, `name`) VALUES (17, 'Спортивная');
INSERT INTO `rent_ap2`.`subway`(`id_subway`, `name`) VALUES (18, 'Молодёжная');
INSERT INTO `rent_ap2`.`subway`(`id_subway`, `name`) VALUES (19, 'Фрунзенская');
INSERT INTO `rent_ap2`.`subway`(`id_subway`, `name`) VALUES (20, 'Немига');
INSERT INTO `rent_ap2`.`subway`(`id_subway`, `name`) VALUES (21, 'Купаловская');
INSERT INTO `rent_ap2`.`subway`(`id_subway`, `name`) VALUES (22, 'Первомайская');
INSERT INTO `rent_ap2`.`subway`(`id_subway`, `name`) VALUES (23, 'Пролетарская');
INSERT INTO `rent_ap2`.`subway`(`id_subway`, `name`) VALUES (24, 'Тракторный завод');
INSERT INTO `rent_ap2`.`subway`(`id_subway`, `name`) VALUES (25, 'Партизанская');
INSERT INTO `rent_ap2`.`subway`(`id_subway`, `name`) VALUES (26, 'Автозаводская');
INSERT INTO `rent_ap2`.`subway`(`id_subway`, `name`) VALUES (27, 'Могилёвская');
INSERT INTO `rent_ap2`.`subway`(`id_subway`, `name`) VALUES (28, 'Уручье');
INSERT INTO `rent_ap2`.`subway`(`id_subway`, `name`) VALUES (29, 'Площадь Ленина');

INSERT INTO `rent_ap2`.`user` (`id_user`, `enabled`, `name`, `password`, `surname`, `username`)
VALUES ('1', '1', 'siarhei', '$2a$10$AJxWh5e.Rbeh4TwcqHOisuDeJ4fGcfU5JgPgTjFQtu/2EMpx7WbXu', 'kalashynski', 'admin');

INSERT INTO `rent_ap2`.`user` (`id_user`, `enabled`, `name`, `password`, `surname`, `username`)
VALUES ('2', '1', 'vlad', '$2a$10$BMmb1fx4bNuYeBuiNnlygeXfWlkF0d1mAMpb5nj9oyD9uIq.CEWha', 'solodkin', 'user');

INSERT INTO `rent_ap2`.`user` (`id_user`, `enabled`, `name`, `password`, `surname`, `username`)
VALUES ('3', '1', 'ьфч', '$2a$10$KNcZ0qN43RaN.yfb2lqMeeKNRDDBIiY3cz1b9mUh73knToByK1UH.', 'kalashynski', 'user1');

INSERT INTO `rent_ap2`.`user_authority` VALUES (1, 1);
INSERT INTO `rent_ap2`.`user_authority` VALUES (2, 2);
INSERT INTO `rent_ap2`.`user_authority` VALUES (3, 2);

INSERT INTO `rent_ap2`.`flat` (`id_flat`, `amount_room`, `average_mark`, `month_price`, `upload_date`, `id_flat_status`)
VALUES ('1', '2', '5', '250', '2017-11-26', '1');
INSERT INTO `rent_ap2`.`flat` (`id_flat`, `amount_room`, `average_mark`, `month_price`, `upload_date`, `id_flat_status`)
VALUES ('2', '3', '4', '300', '2017-12-02', '1');
INSERT INTO `rent_ap2`.`flat` (`id_flat`, `amount_room`, `average_mark`, `month_price`, `upload_date`, `id_flat_status`)
VALUES ('3', '4', '4', '350', '2017-11-26', '1');
INSERT INTO `rent_ap2`.`flat` (`id_flat`, `amount_room`, `average_mark`, `month_price`, `upload_date`, `id_flat_status`)
VALUES ('4', '2', '5', '300', '2017-11-26', '1');
INSERT INTO `rent_ap2`.`flat` (`id_flat`, `amount_room`, `average_mark`, `month_price`, `upload_date`, `id_flat_status`)
VALUES ('5', '2', '4.6', '350', '2017-12-09', '1');
INSERT INTO `rent_ap2`.`flat` (`id_flat`, `amount_room`, `average_mark`, `month_price`, `upload_date`, `id_flat_status`)
VALUES ('6', '4', '3.5', '400', '2017-12-09', '1');
INSERT INTO `rent_ap2`.`flat` (`id_flat`, `amount_room`, `average_mark`, `month_price`, `upload_date`, `id_flat_status`)
VALUES ('7', '3', '2.4', '300', '2017-12-09', '1');
INSERT INTO `rent_ap2`.`flat` (`id_flat`, `amount_room`, `average_mark`, `month_price`, `upload_date`, `id_flat_status`)
VALUES ('8', '5', '4.9', '600', '2017-12-09', '1');
INSERT INTO `rent_ap2`.`flat` (`id_flat`, `amount_room`, `average_mark`, `month_price`, `upload_date`, `id_flat_status`)
VALUES ('9', '4', '5.0', '700', '2017-12-09', '1');
INSERT INTO `rent_ap2`.`flat` (`id_flat`, `amount_room`, `average_mark`, `month_price`, `upload_date`, `id_flat_status`)
VALUES ('10', '2', '4.1', '350', '2017-12-09', '1');


INSERT INTO `rent_ap2`.`address` (`id_address`, `flat_number`, `house_number`, `street`, `id_area`, `id_flat`)
VALUES ('2', '23', '24', 'Притыцкого', '8', '1');
INSERT INTO `rent_ap2`.`address` (`id_address`, `flat_number`, `house_number`, `street`, `id_area`, `id_flat`)
VALUES ('1', '12', '13', 'Якуба Коласа', '9', '2');
INSERT INTO `rent_ap2`.`address` (`id_address`, `flat_number`, `house_number`, `street`, `id_area`, `id_flat`)
VALUES ('3', '5', '45', 'Герасименко', '1', '3');
INSERT INTO `rent_ap2`.`address` (`id_address`, `flat_number`, `house_number`, `street`, `id_area`, `id_flat`)
VALUES ('4', '13', '32', 'Горовца', '2', '4');
INSERT INTO `rent_ap2`.`address` (`id_address`, `flat_number`, `house_number`, `street`, `id_area`, `id_flat`)
VALUES ('5', '32', '54', 'Немига', '3', '5');
INSERT INTO `rent_ap2`.`address` (`id_address`, `flat_number`, `house_number`, `street`, `id_area`, `id_flat`)
VALUES ('6', '43', '35', 'Нефтяная', '4', '6');
INSERT INTO `rent_ap2`.`address` (`id_address`, `flat_number`, `house_number`, `street`, `id_area`, `id_flat`)
VALUES ('7', '65', '64', 'Столетова', '5', '7');
INSERT INTO `rent_ap2`.`address` (`id_address`, `flat_number`, `house_number`, `street`, `id_area`, `id_flat`)
VALUES ('8', '23', '123', 'Пономарева', '6', '8');
INSERT INTO `rent_ap2`.`address` (`id_address`, `flat_number`, `house_number`, `street`, `id_area`, `id_flat`)
VALUES ('9', '45', '34', 'Некрасова', '7', '9');
INSERT INTO `rent_ap2`.`address` (`id_address`, `flat_number`, `house_number`, `street`, `id_area`, `id_flat`)
VALUES ('10', '12', '43', 'Поселковая 2-я', '7', '10');

INSERT INTO `rent_ap2`.`subway_address` (`id_address`, `id_subway`) VALUES ('2', '1');

INSERT INTO `rent_ap2`.`image` (`id_image`, `url`, `id_flat`)
VALUES ('1', 'http://www.terrazzo.by/static/images/projects/realizatsiya-proekta-po-ul-belinskogo//original/1.jpg', '1');
INSERT INTO `rent_ap2`.`image` (`id_image`, `url`, `id_flat`)
VALUES ('2', 'http://www.terrazzo.by/static/images/projects/realizatsiya-proekta-po-ul-belinskogo//original/2-2.jpg', '1');
INSERT INTO `rent_ap2`.`image` (`id_image`, `url`, `id_flat`)
VALUES ('3', 'http://www.terrazzo.by/static/images/projects/realizatsiya-proekta-po-ul-belinskogo//original/2.jpg', '1');
INSERT INTO `rent_ap2`.`image` (`id_image`, `url`, `id_flat`)
VALUES ('4', 'http://www.terrazzo.by/static/images/projects/realizatsiya-proekta-po-ul-belinskogo//original/3-2.jpg', '1');
INSERT INTO `rent_ap2`.`image` (`id_image`, `url`, `id_flat`)
VALUES ('5', 'http://www.terrazzo.by/static/images/projects/realizatsiya-proekta-po-ul-belinskogo//original/3.jpg', '1');
INSERT INTO `rent_ap2`.`image` (`id_image`, `url`, `id_flat`)
VALUES ('6', 'http://www.terrazzo.by/static/images/projects/proekt-po-ul-zhukovskogo/1.jpg', '2');
INSERT INTO `rent_ap2`.`image` (`id_image`, `url`, `id_flat`)
VALUES ('7', 'http://www.terrazzo.by/static/images/projects/proekt-po-ul-zhukovskogo/2.jpg', '2');
INSERT INTO `rent_ap2`.`image` (`id_image`, `url`, `id_flat`)
VALUES ('8', 'http://www.terrazzo.by/static/images/projects/proekt-po-ul-zhukovskogo/4.jpg', '2');
INSERT INTO `rent_ap2`.`image` (`id_image`, `url`, `id_flat`)
VALUES ('9', 'http://www.terrazzo.by/static/images/projects/proekt-po-ul-zhukovskogo/3.jpg', '2');
INSERT INTO `rent_ap2`.`image` (`id_image`, `url`, `id_flat`)
VALUES ('10', 'http://www.terrazzo.by/static/images/projects/proekt-po-ul-zhukovskogo/6.jpg', '2');
INSERT INTO `rent_ap2`.`image` (`id_image`, `url`, `id_flat`)
VALUES ('11', 'http://www.terrazzo.by/static/images/projects/proekt-po-ul-ratomskaya/1.jpg', '3');
INSERT INTO `rent_ap2`.`image` (`id_image`, `url`, `id_flat`)
VALUES ('12', 'http://www.terrazzo.by/static/images/projects/proekt-po-ul-ratomskaya/2.jpg', '3');
INSERT INTO `rent_ap2`.`image` (`id_image`, `url`, `id_flat`)
VALUES ('13', 'http://www.terrazzo.by/static/images/projects/proekt-po-ul-ratomskaya/3.jpg', '3');
INSERT INTO `rent_ap2`.`image` (`id_image`, `url`, `id_flat`)
VALUES ('14', 'http://www.terrazzo.by/static/images/projects/proekt-po-ul-ratomskaya/4.jpg', '3');
INSERT INTO `rent_ap2`.`image` (`id_image`, `url`, `id_flat`)
VALUES ('15', 'http://www.terrazzo.by/static/images/projects/proekt-po-ul-ratomskaya/5.jpg', '3');
INSERT INTO `rent_ap2`.`image` (`id_image`, `url`, `id_flat`)
VALUES ('16', 'http://www.terrazzo.by/static/images/projects/dizajn-proekt-po-pr-pobeditelej/1.jpg', '4');
INSERT INTO `rent_ap2`.`image` (`id_image`, `url`, `id_flat`)
VALUES ('17', 'http://www.terrazzo.by/static/images/projects/dizajn-proekt-po-pr-pobeditelej/2.jpg', '4');
INSERT INTO `rent_ap2`.`image` (`id_image`, `url`, `id_flat`)
VALUES ('18', 'http://www.terrazzo.by/static/images/projects/dizajn-proekt-po-pr-pobeditelej/3.jpg', '4');
INSERT INTO `rent_ap2`.`image` (`id_image`, `url`, `id_flat`)
VALUES ('19', 'http://www.terrazzo.by/static/images/projects/dizajn-proekt-po-pr-pobeditelej/4.jpg', '4');
INSERT INTO `rent_ap2`.`image` (`id_image`, `url`, `id_flat`)
VALUES ('20', 'http://www.terrazzo.by/static/images/projects/dizajn-proekt-po-pr-pobeditelej/5.jpg', '4');
INSERT INTO `rent_ap2`.`image` (`id_image`, `url`, `id_flat`)
VALUES ('21', 'http://www.terrazzo.by/static/images/projects/dizajn-proekt-po-ul-turgeneva/3.jpg', '5');
INSERT INTO `rent_ap2`.`image` (`id_image`, `url`, `id_flat`)
VALUES ('22', 'http://www.terrazzo.by/static/images/projects/dizajn-proekt-po-ul-turgeneva/4.jpg', '5');
INSERT INTO `rent_ap2`.`image` (`id_image`, `url`, `id_flat`)
VALUES ('23', 'http://www.terrazzo.by/static/images/projects/dizajn-proekt-po-ul-turgeneva/7.jpg', '5');
INSERT INTO `rent_ap2`.`image` (`id_image`, `url`, `id_flat`)
VALUES ('24', 'http://www.terrazzo.by/static/images/projects/dizajn-proekt-po-ul-turgeneva/8.jpg', '5');
INSERT INTO `rent_ap2`.`image` (`id_image`, `url`, `id_flat`)
VALUES ('25', 'http://www.terrazzo.by/static/images/projects/dizajn-proekt-po-ul-turgeneva/6.jpg', '5');
INSERT INTO `rent_ap2`.`image` (`id_image`, `url`, `id_flat`)
VALUES ('26', 'http://www.terrazzo.by/static/images/projects/proektu-po-ul-belinskogo/1.jpg', '6');
INSERT INTO `rent_ap2`.`image` (`id_image`, `url`, `id_flat`)
VALUES ('27', 'http://www.terrazzo.by/static/images/projects/proektu-po-ul-belinskogo/2.jpg', '6');
INSERT INTO `rent_ap2`.`image` (`id_image`, `url`, `id_flat`)
VALUES ('28', 'http://www.terrazzo.by/static/images/projects/proektu-po-ul-belinskogo/3.jpg', '6');
INSERT INTO `rent_ap2`.`image` (`id_image`, `url`, `id_flat`)
VALUES ('29', 'http://www.terrazzo.by/static/images/projects/proektu-po-ul-belinskogo/4.jpg', '6');
INSERT INTO `rent_ap2`.`image` (`id_image`, `url`, `id_flat`)
VALUES ('30', 'http://www.terrazzo.by/static/images/projects/proektu-po-ul-belinskogo/5.jpg', '6');
INSERT INTO `rent_ap2`.`image` (`id_image`, `url`, `id_flat`)
VALUES ('31', 'http://www.terrazzo.by/static/images/projects/dizajn-proekt-kvartiry-po-ul-belinskogo/14.jpg', '7');
INSERT INTO `rent_ap2`.`image` (`id_image`, `url`, `id_flat`)
VALUES ('32', 'http://www.terrazzo.by/static/images/projects/dizajn-proekt-kvartiry-po-ul-belinskogo/15.jpg', '7');
INSERT INTO `rent_ap2`.`image` (`id_image`, `url`, `id_flat`)
VALUES ('33', 'http://www.terrazzo.by/static/images/projects/dizajn-proekt-kvartiry-po-ul-belinskogo/16.jpg', '7');
INSERT INTO `rent_ap2`.`image` (`id_image`, `url`, `id_flat`)
VALUES ('34', 'http://www.terrazzo.by/static/images/projects/dizajn-proekt-kvartiry-po-ul-belinskogo/29.jpg', '7');
INSERT INTO `rent_ap2`.`image` (`id_image`, `url`, `id_flat`)
VALUES ('35', 'http://www.terrazzo.by/static/images/projects/dizajn-proekt-kvartiry-po-ul-belinskogo/33.jpg', '7');


INSERT INTO `rent_ap2`.`order_type` (`id_order_type`, `value`) VALUES ('1', 'аренда');
INSERT INTO `rent_ap2`.`order_type` (`id_order_type`, `value`) VALUES ('2', 'покупка');
INSERT INTO `rent_ap2`.`order_status` (`id_order_status`, `value`) VALUES ('2', 'обработана');
INSERT INTO `rent_ap2`.`order_status` (`id_order_status`, `value`) VALUES ('1', 'не обработана');


INSERT INTO `rent_ap2`.`order` (`id_order`, `id_user`, `id_flat`, `id_order_status`, `id_order_type`, `date`) VALUES ('1', '2', '1', '1', '1', '2017-12-10');
INSERT INTO `rent_ap2`.`order` (`id_order`, `id_user`, `id_flat`, `id_order_status`, `id_order_type`, `date`) VALUES ('2', '3', '2', '1', '2', '2017-12-10');
INSERT INTO `rent_ap2`.`order` (`id_order`, `id_user`, `id_flat`, `id_order_status`, `id_order_type`, `date`) VALUES ('3', '2', '3', '1', '1', '2017-12-10');
INSERT INTO `rent_ap2`.`order` (`id_order`, `id_user`, `id_flat`, `id_order_status`, `id_order_type`, `date`) VALUES ('4', '3', '4', '1', '2', '2017-12-10');
INSERT INTO `rent_ap2`.`order` (`id_order`, `id_user`, `id_flat`, `id_order_status`, `id_order_type`, `date`) VALUES ('5', '2', '5', '1', '1', '2017-12-10');
INSERT INTO `rent_ap2`.`order` (`id_order`, `id_user`, `id_flat`, `id_order_status`, `id_order_type`, `date`) VALUES ('6', '3', '6', '1', '2', '2017-12-10');
INSERT INTO `rent_ap2`.`order` (`id_order`, `id_user`, `id_flat`, `id_order_status`, `id_order_type`, `date`) VALUES ('7', '2', '7', '1', '1', '2017-12-10');
INSERT INTO `rent_ap2`.`order` (`id_order`, `id_user`, `id_flat`, `id_order_status`, `id_order_type`, `date`) VALUES ('8', '3', '8', '1', '2', '2017-12-10');
INSERT INTO `rent_ap2`.`order` (`id_order`, `id_user`, `id_flat`, `id_order_status`, `id_order_type`, `date`) VALUES ('9', '2', '9', '1', '1', '2017-12-10');
INSERT INTO `rent_ap2`.`order` (`id_order`, `id_user`, `id_flat`, `id_order_status`, `id_order_type`, `date`) VALUES ('10', '3', '10', '1', '2', '2017-12-10');


