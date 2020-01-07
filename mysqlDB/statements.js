let selectAllTheThings = "SELECT * FROM `tab1`";
let selectPasswd = "SELECT `passwd` FROM `basicusers` WHERE `username` = ?";
let doTheJoins = "SELECT tab1.name, tab2.shoes FROM tab1 INNER JOIN tab2 ON tab1.id = tab2.user_id";
let selectAllBasicUsers = "SELECT * FROM `basicusers`";

module.exports = {
	selectAllBasicUsers,
	selectAllTheThings,
	selectPasswd,
	doTheJoins
}