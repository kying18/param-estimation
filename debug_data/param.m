classdef param 
    
    properties
        %Problem Parameters
            horizon = 3.0; %[s]
            steps = 15; %[] steps of MPC
            integrator_ts = 0.2; %[s] horizon/steps
            integrator_nodes = 1; %[] nodes for each integrator_ts RK4
            path_len = 8; %[] nodes in spline path
            state_vars = 8; %[] length of state vector
            control_vars = 3; %[] length of control vector
            num_ineq = 3; %[] number of inequalities (slip, steer)
     
        %Dynamics Model Parameters
            %Kinematics
            mass = 357; %[kg] mass of vehicle
            Iz = 550; %[kg*m^2] moment of inertia
            w = 1.6; %[m] trackwidth
            l = 2.971; %[m] wheelbase
            lf = 2.01; %[m] front to cg
            lr = 0.960; %[m] rear to cg
            cg_h = 0.217; %[m] height of cg

            %Aero
            cla = -1.034; %[m^2] lift coefficient (based on aero package)
            
            %Constants
            g = -9.81; %[m/s^2] gravity
            rho = 1.225; %[kg/m^3] density of air
            
            %Steer column
            max_steer_rate = 1.5; %[rad/s] max stering rate
            
            %Tires
            slip_peak = 0.115; %[rad] round slip angles down to this, should be <2*slip_peak
            cornering_stiff = 126114; %[N/rad] estimate for normal operatin region
            sample_fz = 4000; %[N]
            
            %Hybrid
            pure_kin = 5; %[m/s] speed at pure kinematic
            pure_dyn = 10; %[m/s] speed at pure dynamic
        
        %Constraints
            %Controls
            max_accel = 16.4; %[m/s^2] accelerating
            min_accel = -20; %[m/s^2] braking
            max_steer = 0.25; %[rad] max steer command
            
            %State
            max_pathrate = 80; %[m/2] max speed down contour
            max_vx = 80; %[m/s] max forward speed
            
            %Tires
            max_mu_lon = 1.6;
            max_mu_lat = 1.7;
            
       %Cost Function
            cw_ec = 19.0; %[] cross-track-error weight
            cw_el = 5.0; %[] lag error weight
            cw_speed = 2.0; %[] weight of speed down path
            cw_ev = 3.0; %[] weight of velocity profile
            cw_control_lon = 1.0; %[] wieght of accel control
            cw_control_lat = 2.5; % [] weight of steer rate control
    end   
    
end
