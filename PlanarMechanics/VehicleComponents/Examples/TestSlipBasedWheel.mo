within PlanarMechanics.VehicleComponents.Examples;
model TestSlipBasedWheel
  extends Modelica.Icons.Example;

  Joints.Prismatic prismatic(r={0,1},
    s(start=1, fixed=true),
    v(fixed=true))
                annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,0})));
  Joints.Revolute revolute(phi(fixed=true), w(fixed=true))
                           annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-30})));
  Parts.Fixed fixed annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,-60})));
  Modelica.Mechanics.Rotational.Sources.ConstantTorque engineTorque(
      tau_constant=2)
    annotation (Placement(transformation(extent={{-32,60},{-12,80}})));
  Parts.Body body(m=10, I=1)
    annotation (Placement(transformation(extent={{20,0},{40,20}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(
    phi(fixed=true, start=0),
    J=1,
    w(fixed=true, start=0)) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={0,60})));
  VehicleComponents.Wheels.SlipBasedWheelJoint slipBasedWheelJoint(
    radius=0.3, r = {1,0},
    mu_A=0.8,
    mu_S=0.4,
    N=100,
    sAdhesion=0.04,
    sSlide=0.12,
    vAdhesion_min=0.05,
    vSlide_min=0.15,
    w_roll(fixed=false, start=10))
              annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,32})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-60,22},{-40,42}})));
  inner PlanarWorld planarWorld(g={0,0})
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
equation
  connect(prismatic.frame_a, revolute.frame_b) annotation (Line(
      points={{-1.68214e-016,-10},{1.05639e-015,-10},{1.05639e-015,-20}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(revolute.frame_a, fixed.frame_a) annotation (Line(
      points={{-1.68214e-016,-40},{2.50304e-015,-40},{2.50304e-015,-50}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(engineTorque.flange, inertia.flange_a) annotation (Line(
      points={{-12,70},{2.33651e-015,70}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(body.frame_a, prismatic.frame_b) annotation (Line(
      points={{20,10},{1.05639e-015,10}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(slipBasedWheelJoint.frame_a, prismatic.frame_b) annotation (Line(
      points={{1.50184e-016,27.2},{1.50184e-016,18.6},{1.05639e-015,18.6},{
          1.05639e-015,10}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(slipBasedWheelJoint.flange_a, inertia.flange_b) annotation (Line(
      points={{1.1119e-015,42},{-1.33731e-015,42},{-1.33731e-015,50}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(const.y, slipBasedWheelJoint.dynamicLoad) annotation (Line(
      points={{-39,32},{-10,32}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Documentation(revisions="<html><p><img src=\"modelica://PlanarMechanics/Resources/Images/dlr_logo.png\"/> <b>Developed 2010-2014 at the DLR Institute of System Dynamics and Control</b> </p></html>",  info="<html>
<p><h4><font color=\"#008000\">A Slip-Based Wheel</font></h4></p>
<p><br/><img src=\"modelica://PlanarMechanics/Resources/Images/TestSlipBasedWheel_1.png\"/></p>
<p><img src=\"modelica://PlanarMechanics/Resources/Images/TestSlipBasedWheel_2.png\"/></p>
<p><br/>&nbsp;SELECTED&nbsp;CONTINUOUS&nbsp;TIME&nbsp;STATES</p>
<p>&nbsp;&nbsp;inertia.phi</p>
<p>&nbsp;&nbsp;inertia.w</p>
<p>&nbsp;&nbsp;prismatic.s</p>
<p>&nbsp;&nbsp;prismatic.v</p>
<p>&nbsp;&nbsp;revolute.phi</p>
<p>&nbsp;&nbsp;revolute.w</p>
</html>",
      revisions="<html>
<p>(c) Copyright by Dirk Zimmer</p>
<p>The library was created and is owned by Dr. Dirk Zimmer.</p>
<p>dirk.zimmer@dlr.de</p>
</html>"),
    experiment(StopTime=20));
end TestSlipBasedWheel;
