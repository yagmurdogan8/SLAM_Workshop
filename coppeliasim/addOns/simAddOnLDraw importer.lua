function sysCall_info()
    return {autoStart=false,menu='Importers\nLDraw importer...'}
end

function sysCall_init()
    local scenePath=sim.getStringParameter(sim.stringparam_scene_path)
    local filePath=simUI.fileDialog(simUI.filedialog_type.load,'Open LDraw file...',scenePath,'','LDraw files (*.ldr; *.dat; *.mpd)','ldr;dat;mpd',true)
    filePath=filePath[1]
    if filePath~='' then
        simLDraw.import(filePath)
    end
    return {cmd='cleanup'}
end
