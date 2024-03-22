local simMujoco={}

function simMujoco.composite(...)
    local xml,info=checkargs({{type='string'},{type='table'}},...)
    local lb=sim.setThreadAutomaticSwitch(false)
    function __cb1(xml,info)
        local xmlOut,infoOut=_S.mujocoCbs[info.prefix](xml,info)
        return xmlOut,infoOut
    end
    local funcNm,t
    if info.callback then
        if not _S.mujocoCbs then
            _S.mujocoCbs={}
        end
        _S.mujocoCbs[info.prefix]=info.callback
        info.cbFunc='__cb1'
    end
    local injectionId=simMujoco._composite(xml,info)
    sim.setThreadAutomaticSwitch(lb)
    return injectionId
end

function simMujoco.injectXML(...)
    local xml,item2,info=checkargs({{type='string'},{type='any'},{type='table',default=NIL,nullable=true}},...)
    local lb=sim.setThreadAutomaticSwitch(false)
    function __cb2(xml,info)
        local xmlOut=_S.mujocoCbs[info.cbId](xml)
        return xmlOut
    end
    local funcNm,t
    info=info or {}
    if info.callback then
        if not _S.mujocoCbs then
            _S.mujocoCbs={}
        end
        local id=0
        while _S.mujocoCbs['+'..id] do
            id=id+1
        end
        id='+'..id
        _S.mujocoCbs[id]=info.callback
        info.cbFunc='__cb2'
        info.cbId=id
    end
    local injectionId=simMujoco._injectXML(xml,item2,info)
    sim.setThreadAutomaticSwitch(lb)
    return injectionId
end

function simMujoco.init()
    -- can only be executed once sim.* functions were initialized
    sim.registerScriptFunction('simMujoco.composite@simIK','int injectionId=simMujoco.composite(string xml,map info)')
    sim.registerScriptFunction('simMujoco.injectXML@simIK','int injectionId=simMujoco.injectXML(string xml,string element,map info)')
    simMujoco.init=nil
end

sim.registerScriptFuncHook('sysCall_init','simMujoco.init',true)

return simMujoco
