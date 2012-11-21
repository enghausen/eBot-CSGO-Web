CREATE TABLE maps (id BIGINT AUTO_INCREMENT, match_id BIGINT NOT NULL, map_name VARCHAR(50), score_1 BIGINT, score_2 BIGINT, current_side VARCHAR(255), status MEDIUMINT, maps_for VARCHAR(255), nb_ot BIGINT, identifier_id BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX match_id_idx (match_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE maps_score (id BIGINT AUTO_INCREMENT, map_id BIGINT NOT NULL, type_score VARCHAR(255), score1_side1 BIGINT, score1_side2 BIGINT, score2_side1 BIGINT, score2_side2 BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX map_id_idx (map_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE matchs (id BIGINT AUTO_INCREMENT, ip VARCHAR(50), server_id BIGINT, team_a VARCHAR(255) NOT NULL, team_a_flag VARCHAR(2), team_b VARCHAR(255) NOT NULL, team_b_flag VARCHAR(2), status SMALLINT, score_a BIGINT, score_b BIGINT, max_round MEDIUMINT NOT NULL, rules VARCHAR(200) NOT NULL, config_full_score TINYINT(1), config_ot TINYINT(1), config_knife_round TINYINT(1), config_switch_auto TINYINT(1), config_auto_change_password TINYINT(1), config_password VARCHAR(50), config_heatmap TINYINT(1), enable TINYINT(1), ingame_enable TINYINT(1), current_map BIGINT, force_zoom_match TINYINT(1), tv_record_file VARCHAR(255), identifier_id BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX server_id_idx (server_id), INDEX current_map_idx (current_map), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE player_kill (id BIGINT AUTO_INCREMENT, match_id BIGINT NOT NULL, map_id BIGINT NOT NULL, killer_name VARCHAR(100), killer_id BIGINT, killer_team VARCHAR(20), killed_name VARCHAR(100), killed_id BIGINT, killed_team VARCHAR(20), weapon VARCHAR(100), headshot TINYINT(1), round_id BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX match_id_idx (match_id), INDEX map_id_idx (map_id), INDEX killer_id_idx (killer_id), INDEX killed_id_idx (killed_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE players (id BIGINT AUTO_INCREMENT, match_id BIGINT NOT NULL, map_id BIGINT NOT NULL, player_key VARCHAR(255), team VARCHAR(255) DEFAULT 'other', ip VARCHAR(255), steamid VARCHAR(255), first_side VARCHAR(255), current_side VARCHAR(255), pseudo VARCHAR(255), nb_kill BIGINT DEFAULT 0, assist BIGINT DEFAULT 0, death BIGINT DEFAULT 0, point BIGINT DEFAULT 0, hs BIGINT DEFAULT 0, defuse BIGINT DEFAULT 0, bombe BIGINT DEFAULT 0, tk BIGINT DEFAULT 0, nb1 BIGINT DEFAULT 0, nb2 BIGINT DEFAULT 0, nb3 BIGINT DEFAULT 0, nb4 BIGINT DEFAULT 0, nb5 BIGINT DEFAULT 0, nb1kill BIGINT DEFAULT 0, nb2kill BIGINT DEFAULT 0, nb3kill BIGINT DEFAULT 0, nb4kill BIGINT DEFAULT 0, nb5kill BIGINT DEFAULT 0, pluskill BIGINT DEFAULT 0, firstkill BIGINT DEFAULT 0, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX match_id_idx (match_id), INDEX map_id_idx (map_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE players_heatmap (id BIGINT AUTO_INCREMENT, match_id BIGINT NOT NULL, map_id BIGINT NOT NULL, event_name VARCHAR(50), event_x DOUBLE(18, 2), event_y DOUBLE(18, 2), event_z DOUBLE(18, 2), player_name VARCHAR(255), player_id BIGINT, player_team VARCHAR(20), attacker_x DOUBLE(18, 2), attacker_y DOUBLE(18, 2), attacker_z DOUBLE(18, 2), attacker_name VARCHAR(255), attacker_id BIGINT, attacker_team VARCHAR(20), round_id BIGINT, round_time BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX match_id_idx (match_id), INDEX map_id_idx (map_id), INDEX player_id_idx (player_id), INDEX attacker_id_idx (attacker_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE players_snapshot (id BIGINT AUTO_INCREMENT, player_id BIGINT NOT NULL, player_key VARCHAR(255), first_side VARCHAR(255), current_side VARCHAR(255), nb_kill BIGINT DEFAULT 0, assist BIGINT DEFAULT 0, death BIGINT DEFAULT 0, point BIGINT DEFAULT 0, hs BIGINT DEFAULT 0, defuse BIGINT DEFAULT 0, bombe BIGINT DEFAULT 0, tk BIGINT DEFAULT 0, nb1 BIGINT DEFAULT 0, nb2 BIGINT DEFAULT 0, nb3 BIGINT DEFAULT 0, nb4 BIGINT DEFAULT 0, nb5 BIGINT DEFAULT 0, nb1kill BIGINT DEFAULT 0, nb2kill BIGINT DEFAULT 0, nb3kill BIGINT DEFAULT 0, nb4kill BIGINT DEFAULT 0, nb5kill BIGINT DEFAULT 0, pluskill BIGINT DEFAULT 0, firstkill BIGINT DEFAULT 0, round_id BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX player_id_idx (player_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE round (id BIGINT AUTO_INCREMENT, match_id BIGINT NOT NULL, map_id BIGINT NOT NULL, event_name VARCHAR(255), event_text text, event_time BIGINT, kill_id BIGINT, round_id BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX match_id_idx (match_id), INDEX map_id_idx (map_id), INDEX kill_id_idx (kill_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE round_summary (id BIGINT AUTO_INCREMENT, match_id BIGINT NOT NULL, map_id BIGINT NOT NULL, bomb_planted TINYINT(1), bomb_defused TINYINT(1), bomb_exploded TINYINT(1), win_type VARCHAR(255) DEFAULT 'normal', team_win VARCHAR(255), ct_win TINYINT(1), t_win TINYINT(1), score_a SMALLINT, score_b SMALLINT, best_killer BIGINT, best_killer_nb BIGINT, best_killer_fk TINYINT(1), best_action_type text, best_action_param text, backup_file_name VARCHAR(255), round_id BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX match_id_idx (match_id), INDEX map_id_idx (map_id), INDEX best_killer_idx (best_killer), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE servers (id BIGINT AUTO_INCREMENT, ip VARCHAR(50) NOT NULL, rcon VARCHAR(50) NOT NULL, hostname VARCHAR(100) NOT NULL, tv_ip VARCHAR(100), created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_forgot_password (id BIGINT AUTO_INCREMENT, user_id BIGINT NOT NULL, unique_key VARCHAR(255), expires_at DATETIME NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX user_id_idx (user_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_group (id BIGINT AUTO_INCREMENT, name VARCHAR(255) UNIQUE, description TEXT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_group_permission (group_id BIGINT, permission_id BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(group_id, permission_id)) ENGINE = INNODB;
CREATE TABLE sf_guard_permission (id BIGINT AUTO_INCREMENT, name VARCHAR(255) UNIQUE, description TEXT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_remember_key (id BIGINT AUTO_INCREMENT, user_id BIGINT, remember_key VARCHAR(32), ip_address VARCHAR(50), created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX user_id_idx (user_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_user (id BIGINT AUTO_INCREMENT, first_name VARCHAR(255), last_name VARCHAR(255), email_address VARCHAR(255) NOT NULL UNIQUE, username VARCHAR(128) NOT NULL UNIQUE, algorithm VARCHAR(128) DEFAULT 'sha1' NOT NULL, salt VARCHAR(128), password VARCHAR(128), is_active TINYINT(1) DEFAULT '1', is_super_admin TINYINT(1) DEFAULT '0', last_login DATETIME, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX is_active_idx_idx (is_active), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_user_group (user_id BIGINT, group_id BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(user_id, group_id)) ENGINE = INNODB;
CREATE TABLE sf_guard_user_permission (user_id BIGINT, permission_id BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(user_id, permission_id)) ENGINE = INNODB;
ALTER TABLE maps ADD CONSTRAINT maps_match_id_matchs_id FOREIGN KEY (match_id) REFERENCES matchs(id) ON DELETE CASCADE;
ALTER TABLE maps_score ADD CONSTRAINT maps_score_map_id_maps_id FOREIGN KEY (map_id) REFERENCES maps(id) ON DELETE CASCADE;
ALTER TABLE matchs ADD CONSTRAINT matchs_server_id_servers_id FOREIGN KEY (server_id) REFERENCES servers(id) ON DELETE CASCADE;
ALTER TABLE matchs ADD CONSTRAINT matchs_current_map_maps_id FOREIGN KEY (current_map) REFERENCES maps(id) ON DELETE CASCADE;
ALTER TABLE player_kill ADD CONSTRAINT player_kill_match_id_matchs_id FOREIGN KEY (match_id) REFERENCES matchs(id) ON DELETE CASCADE;
ALTER TABLE player_kill ADD CONSTRAINT player_kill_map_id_maps_id FOREIGN KEY (map_id) REFERENCES maps(id) ON DELETE CASCADE;
ALTER TABLE player_kill ADD CONSTRAINT player_kill_killer_id_players_id FOREIGN KEY (killer_id) REFERENCES players(id) ON DELETE CASCADE;
ALTER TABLE player_kill ADD CONSTRAINT player_kill_killed_id_players_id FOREIGN KEY (killed_id) REFERENCES players(id) ON DELETE CASCADE;
ALTER TABLE players ADD CONSTRAINT players_match_id_matchs_id FOREIGN KEY (match_id) REFERENCES matchs(id) ON DELETE CASCADE;
ALTER TABLE players ADD CONSTRAINT players_map_id_maps_id FOREIGN KEY (map_id) REFERENCES maps(id) ON DELETE CASCADE;
ALTER TABLE players_heatmap ADD CONSTRAINT players_heatmap_player_id_players_id FOREIGN KEY (player_id) REFERENCES players(id) ON DELETE CASCADE;
ALTER TABLE players_heatmap ADD CONSTRAINT players_heatmap_match_id_matchs_id FOREIGN KEY (match_id) REFERENCES matchs(id) ON DELETE CASCADE;
ALTER TABLE players_heatmap ADD CONSTRAINT players_heatmap_map_id_maps_id FOREIGN KEY (map_id) REFERENCES maps(id) ON DELETE CASCADE;
ALTER TABLE players_heatmap ADD CONSTRAINT players_heatmap_attacker_id_players_id FOREIGN KEY (attacker_id) REFERENCES players(id) ON DELETE SET NULL;
ALTER TABLE players_snapshot ADD CONSTRAINT players_snapshot_player_id_players_id FOREIGN KEY (player_id) REFERENCES players(id) ON DELETE CASCADE;
ALTER TABLE round ADD CONSTRAINT round_match_id_matchs_id FOREIGN KEY (match_id) REFERENCES matchs(id) ON DELETE CASCADE;
ALTER TABLE round ADD CONSTRAINT round_map_id_maps_id FOREIGN KEY (map_id) REFERENCES maps(id) ON DELETE CASCADE;
ALTER TABLE round ADD CONSTRAINT round_kill_id_player_kill_id FOREIGN KEY (kill_id) REFERENCES player_kill(id) ON DELETE SET NULL;
ALTER TABLE round_summary ADD CONSTRAINT round_summary_match_id_matchs_id FOREIGN KEY (match_id) REFERENCES matchs(id) ON DELETE CASCADE;
ALTER TABLE round_summary ADD CONSTRAINT round_summary_map_id_maps_id FOREIGN KEY (map_id) REFERENCES maps(id) ON DELETE CASCADE;
ALTER TABLE round_summary ADD CONSTRAINT round_summary_best_killer_players_id FOREIGN KEY (best_killer) REFERENCES players(id) ON DELETE SET NULL;
ALTER TABLE sf_guard_forgot_password ADD CONSTRAINT sf_guard_forgot_password_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_group_permission ADD CONSTRAINT sf_guard_group_permission_permission_id_sf_guard_permission_id FOREIGN KEY (permission_id) REFERENCES sf_guard_permission(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_group_permission ADD CONSTRAINT sf_guard_group_permission_group_id_sf_guard_group_id FOREIGN KEY (group_id) REFERENCES sf_guard_group(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_remember_key ADD CONSTRAINT sf_guard_remember_key_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_user_group ADD CONSTRAINT sf_guard_user_group_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_user_group ADD CONSTRAINT sf_guard_user_group_group_id_sf_guard_group_id FOREIGN KEY (group_id) REFERENCES sf_guard_group(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_user_permission ADD CONSTRAINT sf_guard_user_permission_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_user_permission ADD CONSTRAINT sf_guard_user_permission_permission_id_sf_guard_permission_id FOREIGN KEY (permission_id) REFERENCES sf_guard_permission(id) ON DELETE CASCADE;
