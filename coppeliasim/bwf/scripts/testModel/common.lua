-- Functions:
-------------------------------------------------------
function model.readInfo()
    -- Read all the data stored in the model
    
    local data=sim.readCustomDataBlock(model.handle,model.tagName)
    if data then
        data=sim.unpackTable(data)
    else
        data={}
    end
    
    -- All the data stored in the model. Set-up default values, and remove unused values
    data.visionBoxSerial=nil
    
    if not data['version'] then
        data['version']=1
    end
    if not data['subtype'] then
        data['subtype']='testModel'
    end
    if not data.myStoredString then
        data.myStoredString='Hello world'
    end
    if not data.myStoredString2 then
        data.myStoredString2='Hello world2'
    end
    if not data.bitCoded then
        data.bitCoded=0 -- bit0 is 1: shape is hidden during simulation
    end
    
    return data
end

function model.writeInfo(data)
    -- Write all the data stored in the model. Before writing, make sure to always first read with readInfo()
    
    if data then
        sim.writeCustomDataBlock(model.handle,model.tagName,sim.packTable(data))
    else
        sim.writeCustomDataBlock(model.handle,model.tagName,'')
    end
end

function model.copyModelParamsToJob(data,jobName)
    -- Copy the model parameters that are job-related to a specific job
    -- Job must already exist!
    local job=data.jobData.jobs[jobName]
--    job.refreshMode=data.refreshMode
end

function model.copyJobToModelParams(data,jobName)
    -- Copy a specific job to the model parameters that are job-related
    local job=data.jobData.jobs[jobName]
--    data.refreshMode=job.refreshMode
end


-- IOHUB referenced object slots (do not modify):
-------------------------------------------------------
model.objRefIdx={}
model.objRefIdx.CONNECTION=1
model.objRefJobInfo={2} -- information about jobs stored in object references. Item 1 is where job related obj refs start, other items are obj ref indices that are in the job scope


-- Handles:
-------------------------------------------------------
model.handles={}
model.handles.body=sim.getObject('./testModel_shape')

