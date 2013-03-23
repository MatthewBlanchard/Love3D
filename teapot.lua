require "Vector"
local v = Vector

teapot = {}

teapot.vertices = {
	v(5.929688,4.125000,0.000000),
	v(5.832031,4.494141,0.000000),
	v(5.945313,4.617188,0.000000),
	v(6.175781,4.494141,0.000000),
	v(6.429688,4.125000,0.000000),
	v(5.387188,4.125000,2.747500),
	v(5.297100,4.494141,2.709170),
	v(5.401602,4.617188,2.753633),
	v(5.614209,4.494141,2.844092),
	v(5.848437,4.125000,2.943750),
	v(3.899688,4.125000,4.970000),
	v(3.830352,4.494141,4.900664),
	v(3.910782,4.617188,4.981094),
	v(4.074414,4.494141,5.144727),
	v(4.254687,4.125000,5.325000),
	v(1.677188,4.125000,6.457500),
	v(1.638858,4.494141,6.367412),
	v(1.683320,4.617188,6.471914),
	v(1.773780,4.494141,6.684522),
	v(1.873438,4.125000,6.918750),
	v(-1.070312,4.125000,7.000000),
	v(-1.070312,4.494141,6.902344),
	v(-1.070312,4.617188,7.015625),
	v(-1.070312,4.494141,7.246094),
	v(-1.070312,4.125000,7.500000),
	v(-4.007656,4.125000,6.457500),
	v(-3.859572,4.494141,6.367412),
	v(-3.847676,4.617188,6.471914),
	v(-3.917371,4.494141,6.684522),
	v(-4.014062,4.125000,6.918750),
	v(-6.209063,4.125000,4.970000),
	v(-6.042168,4.494141,4.900664),
	v(-6.072500,4.617188,4.981094),
	v(-6.217675,4.494141,5.144727),
	v(-6.395312,4.125000,5.325000),
	v(-7.591093,4.125000,2.747500),
	v(-7.464421,4.494141,2.709170),
	v(-7.550137,4.617188,2.753633),
	v(-7.755822,4.494141,2.844092),
	v(-7.989062,4.125000,2.943750),
	v(-8.070313,4.125000,0.000000),
	v(-7.972656,4.494141,0.000000),
	v(-8.085938,4.617188,0.000000),
	v(-8.316406,4.494141,0.000000),
	v(-8.570313,4.125000,0.000000),
	v(-7.527812,4.125000,-2.747500),
	v(-7.437724,4.494141,-2.709170),
	v(-7.542227,4.617188,-2.753633),
	v(-7.754834,4.494141,-2.844092),
	v(-7.989062,4.125000,-2.943750),
	v(-6.040312,4.125000,-4.970000),
	v(-5.970977,4.494141,-4.900664),
	v(-6.051406,4.617188,-4.981094),
	v(-6.215039,4.494141,-5.144727),
	v(-6.395312,4.125000,-5.325000),
	v(-3.817812,4.125000,-6.457500),
	v(-3.779482,4.494141,-6.367412),
	v(-3.823945,4.617188,-6.471914),
	v(-3.914404,4.494141,-6.684522),
	v(-4.014062,4.125000,-6.918750),
	v(-1.070312,4.125000,-7.000000),
	v(-1.070312,4.494141,-6.902344),
	v(-1.070312,4.617188,-7.015625),
	v(-1.070312,4.494141,-7.246094),
	v(-1.070312,4.125000,-7.500000),
	v(1.677188,4.125000,-6.457500),
	v(1.638858,4.494141,-6.367412),
	v(1.683320,4.617188,-6.471914),
	v(1.773780,4.494141,-6.684522),
	v(1.873438,4.125000,-6.918750),
	v(3.899688,4.125000,-4.970000),
	v(3.830352,4.494141,-4.900664),
	v(3.910782,4.617188,-4.981094),
	v(4.074414,4.494141,-5.144727),
	v(4.254687,4.125000,-5.325000),
	v(5.387188,4.125000,-2.747500),
	v(5.297100,4.494141,-2.709170),
	v(5.401602,4.617188,-2.753633),
	v(5.614209,4.494141,-2.844092),
	v(5.848437,4.125000,-2.943750),
	v(7.347656,2.162109,0.000000),
	v(8.148438,0.234375,0.000000),
	v(8.714844,-1.623047,0.000000),
	v(8.929688,-3.375000,0.000000),
	v(6.695264,2.162109,3.304053),
	v(7.433985,0.234375,3.618360),
	v(7.956494,-1.623047,3.840674),
	v(8.154688,-3.375000,3.925000),
	v(4.906446,2.162109,5.976758),
	v(5.475000,0.234375,6.545312),
	v(5.877149,-1.623047,6.947461),
	v(6.029688,-3.375000,7.100000),
	v(2.233740,2.162109,7.765576),
	v(2.548047,0.234375,8.504297),
	v(2.770362,-1.623047,9.026807),
	v(2.854688,-3.375000,9.225000),
	v(-1.070312,2.162109,8.417969),
	v(-1.070312,0.234375,9.218750),
	v(-1.070312,-1.623047,9.785156),
	v(-1.070312,-3.375000,10.000000),
	v(-4.374365,2.162109,7.765576),
	v(-4.688672,0.234375,8.504297),
	v(-4.910986,-1.623047,9.026807),
	v(-4.995313,-3.375000,9.225000),
	v(-7.047071,2.162109,5.976758),
	v(-7.615624,0.234375,6.545312),
	v(-8.017773,-1.623047,6.947461),
	v(-8.170312,-3.375000,7.100000),
	v(-8.835889,2.162109,3.304053),
	v(-9.574610,0.234375,3.618360),
	v(-10.097119,-1.623047,3.840674),
	v(-10.295313,-3.375000,3.925000),
	v(-9.488281,2.162109,0.000000),
	v(-10.289063,0.234375,0.000000),
	v(-10.855469,-1.623047,0.000000),
	v(-11.070313,-3.375000,0.000000),
	v(-8.835889,2.162109,-3.304053),
	v(-9.574610,0.234375,-3.618360),
	v(-10.097119,-1.623047,-3.840674),
	v(-10.295313,-3.375000,-3.925000),
	v(-7.047071,2.162109,-5.976758),
	v(-7.615624,0.234375,-6.545312),
	v(-8.017773,-1.623047,-6.947461),
	v(-8.170312,-3.375000,-7.100000),
	v(-4.374365,2.162109,-7.765576),
	v(-4.688672,0.234375,-8.504297),
	v(-4.910986,-1.623047,-9.026807),
	v(-4.995313,-3.375000,-9.225000),
	v(-1.070312,2.162109,-8.417969),
	v(-1.070312,0.234375,-9.218750),
	v(-1.070312,-1.623047,-9.785156),
	v(-1.070312,-3.375000,-10.000000),
	v(2.233740,2.162109,-7.765576),
	v(2.548047,0.234375,-8.504297),
	v(2.770362,-1.623047,-9.026807),
	v(2.854688,-3.375000,-9.225000),
	v(4.906446,2.162109,-5.976758),
	v(5.475000,0.234375,-6.545312),
	v(5.877149,-1.623047,-6.947461),
	v(6.029688,-3.375000,-7.100000),
	v(6.695264,2.162109,-3.304053),
	v(7.433985,0.234375,-3.618360),
	v(7.956494,-1.623047,-3.840674),
	v(8.154688,-3.375000,-3.925000),
	v(8.539063,-4.857422,0.000000),
	v(7.679688,-5.953125,0.000000),
	v(6.820313,-6.697266,0.000000),
	v(6.429688,-7.125000,0.000000),
	v(7.794336,-4.857422,3.771680),
	v(7.001562,-5.953125,3.434375),
	v(6.208789,-6.697266,3.097070),
	v(5.848437,-7.125000,2.943750),
	v(5.752343,-4.857422,6.822656),
	v(5.142187,-5.953125,6.212500),
	v(4.532031,-6.697266,5.602344),
	v(4.254687,-7.125000,5.325000),
	v(2.701367,-4.857422,8.864649),
	v(2.364063,-5.953125,8.071875),
	v(2.026758,-6.697266,7.279101),
	v(1.873438,-7.125000,6.918750),
	v(-1.070312,-4.857422,9.609375),
	v(-1.070312,-5.953125,8.750000),
	v(-1.070312,-6.697266,7.890625),
	v(-1.070312,-7.125000,7.500000),
	v(-4.841992,-4.857422,8.864649),
	v(-4.504687,-5.953125,8.071875),
	v(-4.167383,-6.697266,7.279101),
	v(-4.014062,-7.125000,6.918750),
	v(-7.892968,-4.857422,6.822656),
	v(-7.282812,-5.953125,6.212500),
	v(-6.672656,-6.697266,5.602344),
	v(-6.395312,-7.125000,5.325000),
	v(-9.934961,-4.857422,3.771680),
	v(-9.142187,-5.953125,3.434375),
	v(-8.349414,-6.697266,3.097070),
	v(-7.989062,-7.125000,2.943750),
	v(-10.679688,-4.857422,0.000000),
	v(-9.820313,-5.953125,0.000000),
	v(-8.960938,-6.697266,0.000000),
	v(-8.570313,-7.125000,0.000000),
	v(-9.934961,-4.857422,-3.771680),
	v(-9.142187,-5.953125,-3.434375),
	v(-8.349414,-6.697266,-3.097070),
	v(-7.989062,-7.125000,-2.943750),
	v(-7.892968,-4.857422,-6.822656),
	v(-7.282812,-5.953125,-6.212500),
	v(-6.672656,-6.697266,-5.602344),
	v(-6.395312,-7.125000,-5.325000),
	v(-4.841992,-4.857422,-8.864649),
	v(-4.504687,-5.953125,-8.071875),
	v(-4.167383,-6.697266,-7.279101),
	v(-4.014062,-7.125000,-6.918750),
	v(-1.070312,-4.857422,-9.609375),
	v(-1.070312,-5.953125,-8.750000),
	v(-1.070312,-6.697266,-7.890625),
	v(-1.070312,-7.125000,-7.500000),
	v(2.701367,-4.857422,-8.864649),
	v(2.364063,-5.953125,-8.071875),
	v(2.026758,-6.697266,-7.279101),
	v(1.873438,-7.125000,-6.918750),
	v(5.752343,-4.857422,-6.822656),
	v(5.142187,-5.953125,-6.212500),
	v(4.532031,-6.697266,-5.602344),
	v(4.254687,-7.125000,-5.325000),
	v(7.794336,-4.857422,-3.771680),
	v(7.001562,-5.953125,-3.434375),
	v(6.208789,-6.697266,-3.097070),
	v(5.848437,-7.125000,-2.943750),
	v(6.259766,-7.400391,0.000000),
	v(5.351563,-7.640625,0.000000),
	v(3.107422,-7.810547,0.000000),
	v(-1.070312,-7.875000,0.000000),
	v(5.691685,-7.400391,2.877056),
	v(4.853868,-7.640625,2.520586),
	v(2.783648,-7.810547,1.639761),
	v(4.134043,-7.400391,5.204355),
	v(3.489219,-7.640625,4.559531),
	v(1.895879,-7.810547,2.966191),
	v(1.806743,-7.400391,6.761997),
	v(1.450274,-7.640625,5.924180),
	v(0.569448,-7.810547,3.853960),
	v(-1.070312,-7.400391,7.330078),
	v(-1.070312,-7.640625,6.421875),
	v(-1.070312,-7.810547,4.177734),
	v(-3.947368,-7.400391,6.761997),
	v(-3.590898,-7.640625,5.924180),
	v(-2.710073,-7.810547,3.853960),
	v(-6.274668,-7.400391,5.204355),
	v(-5.629844,-7.640625,4.559531),
	v(-4.036504,-7.810547,2.966191),
	v(-7.832309,-7.400391,2.877056),
	v(-6.994492,-7.640625,2.520586),
	v(-4.924272,-7.810547,1.639761),
	v(-8.400391,-7.400391,0.000000),
	v(-7.492188,-7.640625,0.000000),
	v(-5.248047,-7.810547,0.000000),
	v(-7.832309,-7.400391,-2.877056),
	v(-6.994492,-7.640625,-2.520586),
	v(-4.924272,-7.810547,-1.639761),
	v(-6.274668,-7.400391,-5.204355),
	v(-5.629844,-7.640625,-4.559531),
	v(-4.036504,-7.810547,-2.966191),
	v(-3.947368,-7.400391,-6.761997),
	v(-3.590898,-7.640625,-5.924180),
	v(-2.710073,-7.810547,-3.853960),
	v(-1.070312,-7.400391,-7.330078),
	v(-1.070312,-7.640625,-6.421875),
	v(-1.070312,-7.810547,-4.177734),
	v(1.806743,-7.400391,-6.761997),
	v(1.450274,-7.640625,-5.924180),
	v(0.569448,-7.810547,-3.853960),
	v(4.134043,-7.400391,-5.204355),
	v(3.489219,-7.640625,-4.559531),
	v(1.895879,-7.810547,-2.966191),
	v(5.691685,-7.400391,-2.877056),
	v(4.853868,-7.640625,-2.520586),
	v(2.783648,-7.810547,-1.639761),
	v(-9.070313,2.250000,0.000000),
	v(-11.406250,2.232422,0.000000),
	v(-13.132813,2.109375,0.000000),
	v(-14.203125,1.775391,0.000000),
	v(-14.570313,1.125000,0.000000),
	v(-8.992188,2.425781,0.843750),
	v(-11.475830,2.405457,0.843750),
	v(-13.298828,2.263184,0.843750),
	v(-14.421631,1.877014,0.843750),
	v(-14.804688,1.125000,0.843750),
	v(-8.820313,2.812500,1.125000),
	v(-11.628906,2.786134,1.125000),
	v(-13.664063,2.601563,1.125000),
	v(-14.902344,2.100586,1.125000),
	v(-15.320313,1.125000,1.125000),
	v(-8.648438,3.199219,0.843750),
	v(-11.781982,3.166809,0.843750),
	v(-14.029297,2.939941,0.843750),
	v(-15.383057,2.324158,0.843750),
	v(-15.835938,1.125000,0.843750),
	v(-8.570313,3.375000,0.000000),
	v(-11.851563,3.339844,0.000000),
	v(-14.195313,3.093750,0.000000),
	v(-15.601563,2.425781,0.000000),
	v(-16.070313,1.125000,0.000000),
	v(-8.648438,3.199219,-0.843750),
	v(-11.781982,3.166809,-0.843750),
	v(-14.029297,2.939941,-0.843750),
	v(-15.383057,2.324158,-0.843750),
	v(-15.835938,1.125000,-0.843750),
	v(-8.820313,2.812500,-1.125000),
	v(-11.628906,2.786134,-1.125000),
	v(-13.664063,2.601563,-1.125000),
	v(-14.902344,2.100586,-1.125000),
	v(-15.320313,1.125000,-1.125000),
	v(-8.992188,2.425781,-0.843750),
	v(-11.475830,2.405457,-0.843750),
	v(-13.298828,2.263184,-0.843750),
	v(-14.421631,1.877014,-0.843750),
	v(-14.804688,1.125000,-0.843750),
	v(-14.375000,0.105469,0.000000),
	v(-13.757813,-1.125000,0.000000),
	v(-12.671875,-2.355469,0.000000),
	v(-11.070313,-3.375000,0.000000),
	v(-14.588013,0.007050,0.843750),
	v(-13.909180,-1.275146,0.843750),
	v(-12.724976,-2.540863,0.843750),
	v(-10.992188,-3.609375,0.843750),
	v(-15.056641,-0.209473,1.125000),
	v(-14.242188,-1.605469,1.125000),
	v(-12.841797,-2.948730,1.125000),
	v(-10.820313,-4.125000,1.125000),
	v(-15.525269,-0.425995,0.843750),
	v(-14.575195,-1.935791,0.843750),
	v(-12.958618,-3.356598,0.843750),
	v(-10.648438,-4.640625,0.843750),
	v(-15.738281,-0.524414,0.000000),
	v(-14.726563,-2.085938,0.000000),
	v(-13.011719,-3.541992,0.000000),
	v(-10.570313,-4.875000,0.000000),
	v(-15.525269,-0.425995,-0.843750),
	v(-14.575195,-1.935791,-0.843750),
	v(-12.958618,-3.356598,-0.843750),
	v(-10.648438,-4.640625,-0.843750),
	v(-15.056641,-0.209473,-1.125000),
	v(-14.242188,-1.605469,-1.125000),
	v(-12.841797,-2.948730,-1.125000),
	v(-10.820313,-4.125000,-1.125000),
	v(-14.588013,0.007050,-0.843750),
	v(-13.909180,-1.275146,-0.843750),
	v(-12.724976,-2.540863,-0.843750),
	v(-10.992188,-3.609375,-0.843750),
	v(7.429688,-0.750000,0.000000),
	v(9.828125,-0.199219,0.000000),
	v(10.867188,1.125000,0.000000),
	v(11.437500,2.730469,0.000000),
	v(12.429688,4.125000,0.000000),
	v(7.429688,-1.394531,1.856250),
	v(10.011230,-0.677124,1.676074),
	v(11.101563,0.846680,1.279688),
	v(11.723145,2.629761,0.883301),
	v(12.898438,4.125000,0.703125),
	v(7.429688,-2.812500,2.475000),
	v(10.414063,-1.728516,2.234766),
	v(11.617188,0.234375,1.706250),
	v(12.351563,2.408203,1.177734),
	v(13.929688,4.125000,0.937500),
	v(7.429688,-4.230469,1.856250),
	v(10.816895,-2.779907,1.676074),
	v(12.132813,-0.377930,1.279688),
	v(12.979980,2.186646,0.883301),
	v(14.960938,4.125000,0.703125),
	v(7.429688,-4.875000,0.000000),
	v(11.000000,-3.257813,0.000000),
	v(12.367188,-0.656250,0.000000),
	v(13.265625,2.085938,0.000000),
	v(15.429688,4.125000,0.000000),
	v(7.429688,-4.230469,-1.856250),
	v(10.816895,-2.779907,-1.676074),
	v(12.132813,-0.377930,-1.279688),
	v(12.979980,2.186646,-0.883301),
	v(14.960938,4.125000,-0.703125),
	v(7.429688,-2.812500,-2.475000),
	v(10.414063,-1.728516,-2.234766),
	v(11.617188,0.234375,-1.706250),
	v(12.351563,2.408203,-1.177734),
	v(13.929688,4.125000,-0.937500),
	v(7.429688,-1.394531,-1.856250),
	v(10.011230,-0.677124,-1.676074),
	v(11.101563,0.846680,-1.279688),
	v(11.723145,2.629761,-0.883301),
	v(12.898438,4.125000,-0.703125),
	v(12.789063,4.335938,0.000000),
	v(13.054688,4.406250,0.000000),
	v(13.132813,4.335938,0.000000),
	v(12.929688,4.125000,0.000000),
	v(13.291077,4.346237,0.659180),
	v(13.525879,4.422729,0.562500),
	v(13.532898,4.350357,0.465820),
	v(13.242188,4.125000,0.421875),
	v(14.395508,4.368896,0.878906),
	v(14.562500,4.458984,0.750000),
	v(14.413086,4.382080,0.621094),
	v(13.929688,4.125000,0.562500),
	v(15.499939,4.391556,0.659180),
	v(15.599121,4.495239,0.562500),
	v(15.293274,4.413804,0.465820),
	v(14.617188,4.125000,0.421875),
	v(16.001953,4.401855,0.000000),
	v(16.070313,4.511719,0.000000),
	v(15.693359,4.428224,0.000000),
	v(14.929688,4.125000,0.000000),
	v(15.499939,4.391556,-0.659180),
	v(15.599121,4.495239,-0.562500),
	v(15.293274,4.413804,-0.465820),
	v(14.617188,4.125000,-0.421875),
	v(14.395508,4.368896,-0.878906),
	v(14.562500,4.458984,-0.750000),
	v(14.413086,4.382080,-0.621094),
	v(13.929688,4.125000,-0.562500),
	v(13.291077,4.346237,-0.659180),
	v(13.525879,4.422729,-0.562500),
	v(13.532898,4.350357,-0.465820),
	v(13.242188,4.125000,-0.421875),
	v(-1.070312,7.875000,0.000000),
	v(0.632813,7.628906,0.000000),
	v(0.554688,7.031250,0.000000),
	v(-0.085937,6.292969,0.000000),
	v(-0.070312,5.625000,0.000000),
	v(0.501414,7.628906,0.670256),
	v(0.429278,7.031250,0.639395),
	v(-0.162029,6.292969,0.386960),
	v(-0.147812,5.625000,0.392500),
	v(0.140489,7.628906,1.210801),
	v(0.084844,7.031250,1.155156),
	v(-0.370879,6.292969,0.699434),
	v(-0.360312,5.625000,0.710000),
	v(-0.400056,7.628906,1.571726),
	v(-0.430918,7.031250,1.499590),
	v(-0.683352,6.292969,0.908284),
	v(-0.677812,5.625000,0.922500),
	v(-1.070312,7.628906,1.703125),
	v(-1.070312,7.031250,1.625000),
	v(-1.070312,6.292969,0.984375),
	v(-1.070312,5.625000,1.000000),
	v(-1.740569,7.628906,1.571726),
	v(-1.709707,7.031250,1.499590),
	v(-1.457273,6.292969,0.908284),
	v(-1.462812,5.625000,0.922500),
	v(-2.281113,7.628906,1.210801),
	v(-2.225469,7.031250,1.155156),
	v(-1.769746,6.292969,0.699434),
	v(-1.780312,5.625000,0.710000),
	v(-2.642038,7.628906,0.670256),
	v(-2.569902,7.031250,0.639395),
	v(-1.978596,6.292969,0.386960),
	v(-1.992812,5.625000,0.392500),
	v(-2.773438,7.628906,0.000000),
	v(-2.695313,7.031250,0.000000),
	v(-2.054687,6.292969,0.000000),
	v(-2.070312,5.625000,0.000000),
	v(-2.642038,7.628906,-0.670256),
	v(-2.569902,7.031250,-0.639395),
	v(-1.978596,6.292969,-0.386960),
	v(-1.992812,5.625000,-0.392500),
	v(-2.281113,7.628906,-1.210801),
	v(-2.225469,7.031250,-1.155156),
	v(-1.769746,6.292969,-0.699434),
	v(-1.780312,5.625000,-0.710000),
	v(-1.740569,7.628906,-1.571726),
	v(-1.709707,7.031250,-1.499590),
	v(-1.457273,6.292969,-0.908284),
	v(-1.462812,5.625000,-0.922500),
	v(-1.070312,7.628906,-1.703125),
	v(-1.070312,7.031250,-1.625000),
	v(-1.070312,6.292969,-0.984375),
	v(-1.070312,5.625000,-1.000000),
	v(-0.400056,7.628906,-1.571726),
	v(-0.430918,7.031250,-1.499590),
	v(-0.683352,6.292969,-0.908284),
	v(-0.677812,5.625000,-0.922500),
	v(0.140489,7.628906,-1.210801),
	v(0.084844,7.031250,-1.155156),
	v(-0.370879,6.292969,-0.699434),
	v(-0.360312,5.625000,-0.710000),
	v(0.501414,7.628906,-0.670256),
	v(0.429278,7.031250,-0.639395),
	v(-0.162029,6.292969,-0.386960),
	v(-0.147812,5.625000,-0.392500),
	v(1.210938,5.179688,0.000000),
	v(3.054688,4.875000,0.000000),
	v(4.710938,4.570313,0.000000),
	v(5.429688,4.125000,0.000000),
	v(1.034141,5.179688,0.895391),
	v(2.735000,4.875000,1.619062),
	v(4.262891,4.570313,2.269140),
	v(4.925938,4.125000,2.551250),
	v(0.549375,5.179688,1.619688),
	v(1.858438,4.875000,2.928750),
	v(3.034375,4.570313,4.104687),
	v(3.544688,4.125000,4.615000),
	v(-0.174922,5.179688,2.104453),
	v(0.548750,4.875000,3.805313),
	v(1.198828,4.570313,5.333203),
	v(1.480938,4.125000,5.996250),
	v(-1.070312,5.179688,2.281250),
	v(-1.070312,4.875000,4.125000),
	v(-1.070312,4.570313,5.781250),
	v(-1.070312,4.125000,6.500000),
	v(-1.965703,5.179688,2.104453),
	v(-2.689375,4.875000,3.805313),
	v(-3.339453,4.570313,5.333203),
	v(-3.621562,4.125000,5.996250),
	v(-2.690000,5.179688,1.619688),
	v(-3.999062,4.875000,2.928750),
	v(-5.174999,4.570313,4.104687),
	v(-5.685312,4.125000,4.615000),
	v(-3.174765,5.179688,0.895391),
	v(-4.875625,4.875000,1.619062),
	v(-6.403516,4.570313,2.269140),
	v(-7.066563,4.125000,2.551250),
	v(-3.351562,5.179688,0.000000),
	v(-5.195313,4.875000,0.000000),
	v(-6.851563,4.570313,0.000000),
	v(-7.570313,4.125000,0.000000),
	v(-3.174765,5.179688,-0.895391),
	v(-4.875625,4.875000,-1.619062),
	v(-6.403516,4.570313,-2.269140),
	v(-7.066563,4.125000,-2.551250),
	v(-2.690000,5.179688,-1.619688),
	v(-3.999062,4.875000,-2.928750),
	v(-5.174999,4.570313,-4.104687),
	v(-5.685312,4.125000,-4.615000),
	v(-1.965703,5.179688,-2.104453),
	v(-2.689375,4.875000,-3.805313),
	v(-3.339453,4.570313,-5.333203),
	v(-3.621562,4.125000,-5.996250),
	v(-1.070312,5.179688,-2.281250),
	v(-1.070312,4.875000,-4.125000),
	v(-1.070312,4.570313,-5.781250),
	v(-1.070312,4.125000,-6.500000),
	v(-0.174922,5.179688,-2.104453),
	v(0.548750,4.875000,-3.805313),
	v(1.198828,4.570313,-5.333203),
	v(1.480938,4.125000,-5.996250),
	v(0.549375,5.179688,-1.619688),
	v(1.858438,4.875000,-2.928750),
	v(3.034375,4.570313,-4.104687),
	v(3.544688,4.125000,-4.615000),
	v(1.034141,5.179688,-0.895391),
	v(2.735000,4.875000,-1.619062),
	v(4.262891,4.570313,-2.269140),
	v(4.925938,4.125000,-2.551250)
}

teapot.faces = {{1,6,7},
	{7,2,1},
	{2,7,8},
	{8,3,2},
	{3,8,9},
	{9,4,3},
	{4,9,10},
	{10,5,4},
	{6,11,12},
	{12,7,6},
	{7,12,13},
	{13,8,7},
	{8,13,14},
	{14,9,8},
	{9,14,15},
	{15,10,9},
	{11,16,17},
	{17,12,11},
	{12,17,18},
	{18,13,12},
	{13,18,19},
	{19,14,13},
	{14,19,20},
	{20,15,14},
	{16,21,22},
	{22,17,16},
	{17,22,23},
	{23,18,17},
	{18,23,24},
	{24,19,18},
	{19,24,25},
	{25,20,19},
	{21,26,27},
	{27,22,21},
	{22,27,28},
	{28,23,22},
	{23,28,29},
	{29,24,23},
	{24,29,30},
	{30,25,24},
	{26,31,32},
	{32,27,26},
	{27,32,33},
	{33,28,27},
	{28,33,34},
	{34,29,28},
	{29,34,35},
	{35,30,29},
	{31,36,37},
	{37,32,31},
	{32,37,38},
	{38,33,32},
	{33,38,39},
	{39,34,33},
	{34,39,40},
	{40,35,34},
	{36,41,42},
	{42,37,36},
	{37,42,43},
	{43,38,37},
	{38,43,44},
	{44,39,38},
	{39,44,45},
	{45,40,39},
	{41,46,47},
	{47,42,41},
	{42,47,48},
	{48,43,42},
	{43,48,49},
	{49,44,43},
	{44,49,50},
	{50,45,44},
	{46,51,52},
	{52,47,46},
	{47,52,53},
	{53,48,47},
	{48,53,54},
	{54,49,48},
	{49,54,55},
	{55,50,49},
	{51,56,57},
	{57,52,51},
	{52,57,58},
	{58,53,52},
	{53,58,59},
	{59,54,53},
	{54,59,60},
	{60,55,54},
	{56,61,62},
	{62,57,56},
	{57,62,63},
	{63,58,57},
	{58,63,64},
	{64,59,58},
	{59,64,65},
	{65,60,59},
	{61,66,67},
	{67,62,61},
	{62,67,68},
	{68,63,62},
	{63,68,69},
	{69,64,63},
	{64,69,70},
	{70,65,64},
	{66,71,72},
	{72,67,66},
	{67,72,73},
	{73,68,67},
	{68,73,74},
	{74,69,68},
	{69,74,75},
	{75,70,69},
	{71,76,77},
	{77,72,71},
	{72,77,78},
	{78,73,72},
	{73,78,79},
	{79,74,73},
	{74,79,80},
	{80,75,74},
	{76,1,2},
	{2,77,76},
	{77,2,3},
	{3,78,77},
	{78,3,4},
	{4,79,78},
	{79,4,5},
	{5,80,79},
	{5,10,85},
	{85,81,5},
	{81,85,86},
	{86,82,81},
	{82,86,87},
	{87,83,82},
	{83,87,88},
	{88,84,83},
	{10,15,89},
	{89,85,10},
	{85,89,90},
	{90,86,85},
	{86,90,91},
	{91,87,86},
	{87,91,92},
	{92,88,87},
	{15,20,93},
	{93,89,15},
	{89,93,94},
	{94,90,89},
	{90,94,95},
	{95,91,90},
	{91,95,96},
	{96,92,91},
	{20,25,97},
	{97,93,20},
	{93,97,98},
	{98,94,93},
	{94,98,99},
	{99,95,94},
	{95,99,100},
	{100,96,95},
	{25,30,101},
	{101,97,25},
	{97,101,102},
	{102,98,97},
	{98,102,103},
	{103,99,98},
	{99,103,104},
	{104,100,99},
	{30,35,105},
	{105,101,30},
	{101,105,106},
	{106,102,101},
	{102,106,107},
	{107,103,102},
	{103,107,108},
	{108,104,103},
	{35,40,109},
	{109,105,35},
	{105,109,110},
	{110,106,105},
	{106,110,111},
	{111,107,106},
	{107,111,112},
	{112,108,107},
	{40,45,113},
	{113,109,40},
	{109,113,114},
	{114,110,109},
	{110,114,115},
	{115,111,110},
	{111,115,116},
	{116,112,111},
	{45,50,117},
	{117,113,45},
	{113,117,118},
	{118,114,113},
	{114,118,119},
	{119,115,114},
	{115,119,120},
	{120,116,115},
	{50,55,121},
	{121,117,50},
	{117,121,122},
	{122,118,117},
	{118,122,123},
	{123,119,118},
	{119,123,124},
	{124,120,119},
	{55,60,125},
	{125,121,55},
	{121,125,126},
	{126,122,121},
	{122,126,127},
	{127,123,122},
	{123,127,128},
	{128,124,123},
	{60,65,129},
	{129,125,60},
	{125,129,130},
	{130,126,125},
	{126,130,131},
	{131,127,126},
	{127,131,132},
	{132,128,127},
	{65,70,133},
	{133,129,65},
	{129,133,134},
	{134,130,129},
	{130,134,135},
	{135,131,130},
	{131,135,136},
	{136,132,131},
	{70,75,137},
	{137,133,70},
	{133,137,138},
	{138,134,133},
	{134,138,139},
	{139,135,134},
	{135,139,140},
	{140,136,135},
	{75,80,141},
	{141,137,75},
	{137,141,142},
	{142,138,137},
	{138,142,143},
	{143,139,138},
	{139,143,144},
	{144,140,139},
	{80,5,81},
	{81,141,80},
	{141,81,82},
	{82,142,141},
	{142,82,83},
	{83,143,142},
	{143,83,84},
	{84,144,143},
	{84,88,149},
	{149,145,84},
	{145,149,150},
	{150,146,145},
	{146,150,151},
	{151,147,146},
	{147,151,152},
	{152,148,147},
	{88,92,153},
	{153,149,88},
	{149,153,154},
	{154,150,149},
	{150,154,155},
	{155,151,150},
	{151,155,156},
	{156,152,151},
	{92,96,157},
	{157,153,92},
	{153,157,158},
	{158,154,153},
	{154,158,159},
	{159,155,154},
	{155,159,160},
	{160,156,155},
	{96,100,161},
	{161,157,96},
	{157,161,162},
	{162,158,157},
	{158,162,163},
	{163,159,158},
	{159,163,164},
	{164,160,159},
	{100,104,165},
	{165,161,100},
	{161,165,166},
	{166,162,161},
	{162,166,167},
	{167,163,162},
	{163,167,168},
	{168,164,163},
	{104,108,169},
	{169,165,104},
	{165,169,170},
	{170,166,165},
	{166,170,171},
	{171,167,166},
	{167,171,172},
	{172,168,167},
	{108,112,173},
	{173,169,108},
	{169,173,174},
	{174,170,169},
	{170,174,175},
	{175,171,170},
	{171,175,176},
	{176,172,171},
	{112,116,177},
	{177,173,112},
	{173,177,178},
	{178,174,173},
	{174,178,179},
	{179,175,174},
	{175,179,180},
	{180,176,175},
	{116,120,181},
	{181,177,116},
	{177,181,182},
	{182,178,177},
	{178,182,183},
	{183,179,178},
	{179,183,184},
	{184,180,179},
	{120,124,185},
	{185,181,120},
	{181,185,186},
	{186,182,181},
	{182,186,187},
	{187,183,182},
	{183,187,188},
	{188,184,183},
	{124,128,189},
	{189,185,124},
	{185,189,190},
	{190,186,185},
	{186,190,191},
	{191,187,186},
	{187,191,192},
	{192,188,187},
	{128,132,193},
	{193,189,128},
	{189,193,194},
	{194,190,189},
	{190,194,195},
	{195,191,190},
	{191,195,196},
	{196,192,191},
	{132,136,197},
	{197,193,132},
	{193,197,198},
	{198,194,193},
	{194,198,199},
	{199,195,194},
	{195,199,200},
	{200,196,195},
	{136,140,201},
	{201,197,136},
	{197,201,202},
	{202,198,197},
	{198,202,203},
	{203,199,198},
	{199,203,204},
	{204,200,199},
	{140,144,205},
	{205,201,140},
	{201,205,206},
	{206,202,201},
	{202,206,207},
	{207,203,202},
	{203,207,208},
	{208,204,203},
	{144,84,145},
	{145,205,144},
	{205,145,146},
	{146,206,205},
	{206,146,147},
	{147,207,206},
	{207,147,148},
	{148,208,207},
	{148,152,213},
	{213,209,148},
	{209,213,214},
	{214,210,209},
	{210,214,215},
	{215,211,210},
	{211,215,212},
	{152,156,216},
	{216,213,152},
	{213,216,217},
	{217,214,213},
	{214,217,218},
	{218,215,214},
	{215,218,212},
	{156,160,219},
	{219,216,156},
	{216,219,220},
	{220,217,216},
	{217,220,221},
	{221,218,217},
	{218,221,212},
	{160,164,222},
	{222,219,160},
	{219,222,223},
	{223,220,219},
	{220,223,224},
	{224,221,220},
	{221,224,212},
	{164,168,225},
	{225,222,164},
	{222,225,226},
	{226,223,222},
	{223,226,227},
	{227,224,223},
	{224,227,212},
	{168,172,228},
	{228,225,168},
	{225,228,229},
	{229,226,225},
	{226,229,230},
	{230,227,226},
	{227,230,212},
	{172,176,231},
	{231,228,172},
	{228,231,232},
	{232,229,228},
	{229,232,233},
	{233,230,229},
	{230,233,212},
	{176,180,234},
	{234,231,176},
	{231,234,235},
	{235,232,231},
	{232,235,236},
	{236,233,232},
	{233,236,212},
	{180,184,237},
	{237,234,180},
	{234,237,238},
	{238,235,234},
	{235,238,239},
	{239,236,235},
	{236,239,212},
	{184,188,240},
	{240,237,184},
	{237,240,241},
	{241,238,237},
	{238,241,242},
	{242,239,238},
	{239,242,212},
	{188,192,243},
	{243,240,188},
	{240,243,244},
	{244,241,240},
	{241,244,245},
	{245,242,241},
	{242,245,212},
	{192,196,246},
	{246,243,192},
	{243,246,247},
	{247,244,243},
	{244,247,248},
	{248,245,244},
	{245,248,212},
	{196,200,249},
	{249,246,196},
	{246,249,250},
	{250,247,246},
	{247,250,251},
	{251,248,247},
	{248,251,212},
	{200,204,252},
	{252,249,200},
	{249,252,253},
	{253,250,249},
	{250,253,254},
	{254,251,250},
	{251,254,212},
	{204,208,255},
	{255,252,204},
	{252,255,256},
	{256,253,252},
	{253,256,257},
	{257,254,253},
	{254,257,212},
	{208,148,209},
	{209,255,208},
	{255,209,210},
	{210,256,255},
	{256,210,211},
	{211,257,256},
	{257,211,212},
	{258,263,264},
	{264,259,258},
	{259,264,265},
	{265,260,259},
	{260,265,266},
	{266,261,260},
	{261,266,267},
	{267,262,261},
	{263,268,269},
	{269,264,263},
	{264,269,270},
	{270,265,264},
	{265,270,271},
	{271,266,265},
	{266,271,272},
	{272,267,266},
	{268,273,274},
	{274,269,268},
	{269,274,275},
	{275,270,269},
	{270,275,276},
	{276,271,270},
	{271,276,277},
	{277,272,271},
	{273,278,279},
	{279,274,273},
	{274,279,280},
	{280,275,274},
	{275,280,281},
	{281,276,275},
	{276,281,282},
	{282,277,276},
	{278,283,284},
	{284,279,278},
	{279,284,285},
	{285,280,279},
	{280,285,286},
	{286,281,280},
	{281,286,287},
	{287,282,281},
	{283,288,289},
	{289,284,283},
	{284,289,290},
	{290,285,284},
	{285,290,291},
	{291,286,285},
	{286,291,292},
	{292,287,286},
	{288,293,294},
	{294,289,288},
	{289,294,295},
	{295,290,289},
	{290,295,296},
	{296,291,290},
	{291,296,297},
	{297,292,291},
	{293,258,259},
	{259,294,293},
	{294,259,260},
	{260,295,294},
	{295,260,261},
	{261,296,295},
	{296,261,262},
	{262,297,296},
	{262,267,302},
	{302,298,262},
	{298,302,303},
	{303,299,298},
	{299,303,304},
	{304,300,299},
	{300,304,305},
	{305,301,300},
	{267,272,306},
	{306,302,267},
	{302,306,307},
	{307,303,302},
	{303,307,308},
	{308,304,303},
	{304,308,309},
	{309,305,304},
	{272,277,310},
	{310,306,272},
	{306,310,311},
	{311,307,306},
	{307,311,312},
	{312,308,307},
	{308,312,313},
	{313,309,308},
	{277,282,314},
	{314,310,277},
	{310,314,315},
	{315,311,310},
	{311,315,316},
	{316,312,311},
	{312,316,317},
	{317,313,312},
	{282,287,318},
	{318,314,282},
	{314,318,319},
	{319,315,314},
	{315,319,320},
	{320,316,315},
	{316,320,321},
	{321,317,316},
	{287,292,322},
	{322,318,287},
	{318,322,323},
	{323,319,318},
	{319,323,324},
	{324,320,319},
	{320,324,325},
	{325,321,320},
	{292,297,326},
	{326,322,292},
	{322,326,327},
	{327,323,322},
	{323,327,328},
	{328,324,323},
	{324,328,329},
	{329,325,324},
	{297,262,298},
	{298,326,297},
	{326,298,299},
	{299,327,326},
	{327,299,300},
	{300,328,327},
	{328,300,301},
	{301,329,328},
	{330,335,336},
	{336,331,330},
	{331,336,337},
	{337,332,331},
	{332,337,338},
	{338,333,332},
	{333,338,339},
	{339,334,333},
	{335,340,341},
	{341,336,335},
	{336,341,342},
	{342,337,336},
	{337,342,343},
	{343,338,337},
	{338,343,344},
	{344,339,338},
	{340,345,346},
	{346,341,340},
	{341,346,347},
	{347,342,341},
	{342,347,348},
	{348,343,342},
	{343,348,349},
	{349,344,343},
	{345,350,351},
	{351,346,345},
	{346,351,352},
	{352,347,346},
	{347,352,353},
	{353,348,347},
	{348,353,354},
	{354,349,348},
	{350,355,356},
	{356,351,350},
	{351,356,357},
	{357,352,351},
	{352,357,358},
	{358,353,352},
	{353,358,359},
	{359,354,353},
	{355,360,361},
	{361,356,355},
	{356,361,362},
	{362,357,356},
	{357,362,363},
	{363,358,357},
	{358,363,364},
	{364,359,358},
	{360,365,366},
	{366,361,360},
	{361,366,367},
	{367,362,361},
	{362,367,368},
	{368,363,362},
	{363,368,369},
	{369,364,363},
	{365,330,331},
	{331,366,365},
	{366,331,332},
	{332,367,366},
	{367,332,333},
	{333,368,367},
	{368,333,334},
	{334,369,368},
	{334,339,374},
	{374,370,334},
	{370,374,375},
	{375,371,370},
	{371,375,376},
	{376,372,371},
	{372,376,377},
	{377,373,372},
	{339,344,378},
	{378,374,339},
	{374,378,379},
	{379,375,374},
	{375,379,380},
	{380,376,375},
	{376,380,381},
	{381,377,376},
	{344,349,382},
	{382,378,344},
	{378,382,383},
	{383,379,378},
	{379,383,384},
	{384,380,379},
	{380,384,385},
	{385,381,380},
	{349,354,386},
	{386,382,349},
	{382,386,387},
	{387,383,382},
	{383,387,388},
	{388,384,383},
	{384,388,389},
	{389,385,384},
	{354,359,390},
	{390,386,354},
	{386,390,391},
	{391,387,386},
	{387,391,392},
	{392,388,387},
	{388,392,393},
	{393,389,388},
	{359,364,394},
	{394,390,359},
	{390,394,395},
	{395,391,390},
	{391,395,396},
	{396,392,391},
	{392,396,397},
	{397,393,392},
	{364,369,398},
	{398,394,364},
	{394,398,399},
	{399,395,394},
	{395,399,400},
	{400,396,395},
	{396,400,401},
	{401,397,396},
	{369,334,370},
	{370,398,369},
	{398,370,371},
	{371,399,398},
	{399,371,372},
	{372,400,399},
	{400,372,373},
	{373,401,400},
	{407,403,402},
	{403,407,408},
	{408,404,403},
	{404,408,409},
	{409,405,404},
	{405,409,410},
	{410,406,405},
	{411,407,402},
	{407,411,412},
	{412,408,407},
	{408,412,413},
	{413,409,408},
	{409,413,414},
	{414,410,409},
	{415,411,402},
	{411,415,416},
	{416,412,411},
	{412,416,417},
	{417,413,412},
	{413,417,418},
	{418,414,413},
	{419,415,402},
	{415,419,420},
	{420,416,415},
	{416,420,421},
	{421,417,416},
	{417,421,422},
	{422,418,417},
	{423,419,402},
	{419,423,424},
	{424,420,419},
	{420,424,425},
	{425,421,420},
	{421,425,426},
	{426,422,421},
	{427,423,402},
	{423,427,428},
	{428,424,423},
	{424,428,429},
	{429,425,424},
	{425,429,430},
	{430,426,425},
	{431,427,402},
	{427,431,432},
	{432,428,427},
	{428,432,433},
	{433,429,428},
	{429,433,434},
	{434,430,429},
	{435,431,402},
	{431,435,436},
	{436,432,431},
	{432,436,437},
	{437,433,432},
	{433,437,438},
	{438,434,433},
	{439,435,402},
	{435,439,440},
	{440,436,435},
	{436,440,441},
	{441,437,436},
	{437,441,442},
	{442,438,437},
	{443,439,402},
	{439,443,444},
	{444,440,439},
	{440,444,445},
	{445,441,440},
	{441,445,446},
	{446,442,441},
	{447,443,402},
	{443,447,448},
	{448,444,443},
	{444,448,449},
	{449,445,444},
	{445,449,450},
	{450,446,445},
	{451,447,402},
	{447,451,452},
	{452,448,447},
	{448,452,453},
	{453,449,448},
	{449,453,454},
	{454,450,449},
	{455,451,402},
	{451,455,456},
	{456,452,451},
	{452,456,457},
	{457,453,452},
	{453,457,458},
	{458,454,453},
	{459,455,402},
	{455,459,460},
	{460,456,455},
	{456,460,461},
	{461,457,456},
	{457,461,462},
	{462,458,457},
	{463,459,402},
	{459,463,464},
	{464,460,459},
	{460,464,465},
	{465,461,460},
	{461,465,466},
	{466,462,461},
	{403,463,402},
	{463,403,404},
	{404,464,463},
	{464,404,405},
	{405,465,464},
	{465,405,406},
	{406,466,465},
	{406,410,471},
	{471,467,406},
	{467,471,472},
	{472,468,467},
	{468,472,473},
	{473,469,468},
	{469,473,474},
	{474,470,469},
	{410,414,475},
	{475,471,410},
	{471,475,476},
	{476,472,471},
	{472,476,477},
	{477,473,472},
	{473,477,478},
	{478,474,473},
	{414,418,479},
	{479,475,414},
	{475,479,480},
	{480,476,475},
	{476,480,481},
	{481,477,476},
	{477,481,482},
	{482,478,477},
	{418,422,483},
	{483,479,418},
	{479,483,484},
	{484,480,479},
	{480,484,485},
	{485,481,480},
	{481,485,486},
	{486,482,481},
	{422,426,487},
	{487,483,422},
	{483,487,488},
	{488,484,483},
	{484,488,489},
	{489,485,484},
	{485,489,490},
	{490,486,485},
	{426,430,491},
	{491,487,426},
	{487,491,492},
	{492,488,487},
	{488,492,493},
	{493,489,488},
	{489,493,494},
	{494,490,489},
	{430,434,495},
	{495,491,430},
	{491,495,496},
	{496,492,491},
	{492,496,497},
	{497,493,492},
	{493,497,498},
	{498,494,493},
	{434,438,499},
	{499,495,434},
	{495,499,500},
	{500,496,495},
	{496,500,501},
	{501,497,496},
	{497,501,502},
	{502,498,497},
	{438,442,503},
	{503,499,438},
	{499,503,504},
	{504,500,499},
	{500,504,505},
	{505,501,500},
	{501,505,506},
	{506,502,501},
	{442,446,507},
	{507,503,442},
	{503,507,508},
	{508,504,503},
	{504,508,509},
	{509,505,504},
	{505,509,510},
	{510,506,505},
	{446,450,511},
	{511,507,446},
	{507,511,512},
	{512,508,507},
	{508,512,513},
	{513,509,508},
	{509,513,514},
	{514,510,509},
	{450,454,515},
	{515,511,450},
	{511,515,516},
	{516,512,511},
	{512,516,517},
	{517,513,512},
	{513,517,518},
	{518,514,513},
	{454,458,519},
	{519,515,454},
	{515,519,520},
	{520,516,515},
	{516,520,521},
	{521,517,516},
	{517,521,522},
	{522,518,517},
	{458,462,523},
	{523,519,458},
	{519,523,524},
	{524,520,519},
	{520,524,525},
	{525,521,520},
	{521,525,526},
	{526,522,521},
	{462,466,527},
	{527,523,462},
	{523,527,528},
	{528,524,523},
	{524,528,529},
	{529,525,524},
	{525,529,530},
	{530,526,525},
	{466,406,467},
	{467,527,466},
	{527,467,468},
	{468,528,527},
	{528,468,469},
	{469,529,528},
	{529,469,470},
	{470,530,529}
}