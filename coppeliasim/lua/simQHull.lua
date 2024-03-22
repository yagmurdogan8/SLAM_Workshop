local simQHull={}

function simQHull.computeShape(handles)
    local vert={}
    local edges=1
    local colorAD,colorSp,colorEm=nil,nil,nil
    for _,h in ipairs(handles) do
        local t=sim.getObjectType(h)
        if t==sim.object_shape_type then
            edges=edges*sim.getObjectInt32Param(h,sim.shapeintparam_edge_visibility)
            if not colorAD then
                _,colorAD=sim.getShapeColor(h,nil,sim.colorcomponent_ambient_diffuse)
                _,colorSp=sim.getShapeColor(h,nil,sim.colorcomponent_specular)
                _,colorEm=sim.getShapeColor(h,nil,sim.colorcomponent_emission)
            end
            local v,i,n=sim.getShapeMesh(h)
            local m=sim.getObjectMatrix(h,-1)
            v=sim.multiplyVector(m,v)
            for _,x in ipairs(v) do table.insert(vert,x) end
        elseif t==sim.object_dummy_type then
            local p=sim.getObjectPosition(h,-1)
            for _,x in ipairs(p) do table.insert(vert,x) end
        else
            sim.addLog(sim.verbosity_warnings,'unsupported object type: '..t)
        end
    end
    if #vert==0 then error('empty input') end
    colorAD=colorAD or {0.85,0.85,0.85}
    colorSp=colorSp or {0,0,0}
    colorEm=colorEm or {0,0,0}
    local v,i=simQHull.compute(vert,true)
    local h=sim.createMeshShape(1+2*edges,math.pi/8,v,i)
    sim.setShapeColor(h,nil,sim.colorcomponent_ambient_diffuse,colorAD)
    sim.setShapeColor(h,nil,sim.colorcomponent_specular,colorSp)
    sim.setShapeColor(h,nil,sim.colorcomponent_emission,colorEm)
    return h
end

return simQHull
