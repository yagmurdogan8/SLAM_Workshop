-- simSubprocess lua type-checking wrapper
-- (this file is automatically generated: do not edit)
require 'checkargs'

local simSubprocess=require('simSubprocess')

function simSubprocess.__addTypeCheck()
    local function wrapFunc(funcName,wrapperGenerator)
        _G['simSubprocess'][funcName]=wrapperGenerator(_G['simSubprocess'][funcName])
    end

    simSubprocess.__addTypeCheck=nil
end

sim.registerScriptFuncHook('sysCall_init','simSubprocess.__addTypeCheck',true)

return simSubprocess