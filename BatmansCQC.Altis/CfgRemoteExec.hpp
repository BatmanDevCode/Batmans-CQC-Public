#define SERVER 2
#define CLIENT 1
#define ANYONE 0

class CfgRemoteExec {
    mode = 1;
    jip = 1;

    class Functions {
        class CQC_fnc_notificationSystem
		{
			allowedTargets = ANYONE;
			jip = 0;
		};
    };

    class Commands {
        mode = 1;
        jip = 1;

        class setVelocity               {allowedTargets = CLIENT;};
        class disableUserInput          {allowedTargets = CLIENT;};
        class allowDamage               {allowedTargets = CLIENT;};
        class hideObjectGlobal          {allowedTargets = SERVER;};
        class enableSimulationGlobal    {allowedTargets = SERVER;};
    };
};
