local simIGL={}

--@fun getMesh get mesh data of a given shape in the format used by simIGL functions
--@arg int h the handle of the shape
--@arg {type=table,default={}} options options
--@ret table mesh mesh object
function simIGL.getMesh(h,options)
    local v,i,n=sim.getShapeMesh(h)
    local m=sim.getObjectMatrix(h,-1)
    v=sim.multiplyVector(m,v)
    return {vertices=v, indices=i}
end

--@fun meshBooleanShape convenience wrapper for simIGL.meshBoolean to operate on shapes directly
--@arg table.int handles the handle of the input shapes
--@arg int op the operation (see simIGL.boolean_op)
--@ret int handleResult the handle of the resulting shape
function simIGL.meshBooleanShape(handles,op)
    if #handles<2 then error('not enough input shapes') end
    local meshes=map(simIGL.getMesh,handles)
    local result=simIGL.meshBoolean(meshes[1],meshes[2],op)
    for i=3,#meshes do result=simIGL.meshBoolean(result,meshes[i],op) end
    local edges=sim.getObjectInt32Param(handles[1],sim.shapeintparam_edge_visibility)
    local culling=sim.getObjectInt32Param(handles[1],sim.shapeintparam_culling)
    if #result.vertices==0 then return end
    result=sim.createMeshShape(1+2*edges,math.pi/8,result.vertices,result.indices)
    local _,colad=sim.getShapeColor(handles[1],nil,sim.colorcomponent_ambient_diffuse)
    sim.setShapeColor(result,nil,sim.colorcomponent_ambient_diffuse,colad)
    local _,colsp=sim.getShapeColor(handles[1],nil,sim.colorcomponent_specular)
    sim.setShapeColor(result,nil,sim.colorcomponent_specular,colsp)
    local _,colem=sim.getShapeColor(handles[1],nil,sim.colorcomponent_emission)
    sim.setShapeColor(result,nil,sim.colorcomponent_emission,colem)
    sim.reorientShapeBoundingBox(result,sim.handle_world)
    sim.setObjectInt32Param(result,sim.shapeintparam_culling,culling)
    return result
end

--@fun convexHullShape convenience wrapper for simIGL.convexHull to operate on shapes directly
--@arg table.int handles the handle of the input shapes
--@ret int handleResult the handle of the resulting shape
function simIGL.convexHullShape(handles)
    local vert={}
    local edges=1
    local colorAD,colorSp,colorEm=nil,nil,nil
    for i,h in ipairs(handles) do
        local toadd={}
        local t=sim.getObjectType(h)
        if t==sim.object_shape_type then
            edges=edges*sim.getObjectInt32Param(h,sim.shapeintparam_edge_visibility)
            if not colorAD then
                _,colorAD=sim.getShapeColor(h,nil,sim.colorcomponent_ambient_diffuse)
                _,colorSp=sim.getShapeColor(h,nil,sim.colorcomponent_specular)
                _,colorEm=sim.getShapeColor(h,nil,sim.colorcomponent_emission)
            end
            local m=simIGL.getMesh(h)
            toadd=m.vertices
        elseif t==sim.object_dummy_type then
            toadd=sim.getObjectType(h,sim.handle_world)
        else
            error('unsupported object type')
        end
        if #vert>0 then
            for _,x in ipairs(toadd) do
                table.insert(vert,x)
            end
        else
            vert=toadd
        end
    end
    if #vert==0 then error('empty input') end
    colorAD=colorAD or {0.85,0.85,0.85}
    colorSp=colorSp or {0,0,0}
    colorEm=colorEm or {0,0,0}
    local m=simIGL.convexHull(vert)
    local h=sim.createMeshShape(1+2*edges,math.pi/8,m.vertices,m.indices)
    sim.setShapeColor(h,nil,sim.colorcomponent_ambient_diffuse,colorAD)
    sim.setShapeColor(h,nil,sim.colorcomponent_specular,colorSp)
    sim.setShapeColor(h,nil,sim.colorcomponent_emission,colorEm)
    return h
end

return simIGL
