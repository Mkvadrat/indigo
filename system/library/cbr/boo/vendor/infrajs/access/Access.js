
window.Access = {};

Access.admin = function () {
	return Load.loadJSON('-access/')['admin'];
}
Access.debug = function () {
	return Load.loadJSON('-access/')['debug'];
}
Access.adminTime = function () {
	return Load.loadJSON('-access/')['time'];
}
Access.getDebugTime = function () {
	if (Access.debug()) return time();
	else return Access.adminTime();
}
if (!window.infra) window.infra={}; if (!window.infrajs) window.infrajs={};
infra.admin = Access.admin;
infra.debug = Access.debug;