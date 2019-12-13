let selectAllBasicUsers = "SELECT * FROM `basicusers`";
let selectPasswd = "SELECT `passwd` FROM `basicusers` WHERE `username` = ?";

module.exports = {
	selectAllBasicUsers,
	selectPasswd
}