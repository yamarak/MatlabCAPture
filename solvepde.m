tic
model = createpde("electromagnetic","electrostatic");
gm = multicuboid(0.005,0.005,[0.002 0.003],"Zoffset",[-0.0025 -0.0005]);
model.Geometry = gm;
model.VacuumPermittivity = 8.8541878128E-12;
electromagneticProperties(model,"RelativePermittivity",10.9);
electromagneticBC(model,"Face",[1 3 4 5 6],"Voltage",0);
electromagneticBC(model,"Face",7,"Voltage",1000);
generateMesh(model,"Hmax",8.660254037844385e-05);
R = solve(model);
toc