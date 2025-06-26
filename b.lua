function ztqk(lib, ofs)
    local jxru = gg.getRangesList(lib)
    if #jxru == 0 then return nil end
    for _, mndw in ipairs(jxru) do
        if gg.getValues({{address = mndw.start, flags = 0x4}})[1].value == 0x464C457F then
            return mndw.start + ofs
        end
    end
    return nil
end

function lbxg(a, b)
    return (a ~ 0x12345678) ~ (b ~ 0x12345678)
end

function ndwe(xyo, pmi, rfd)
    return gg.getValues({{address = xyo + pmi, flags = rfd}})[1].value
end

function vfka(xyo, pmi, rfd, nv)
    gg.setValues({{address = xyo + pmi, flags = rfd, value = nv}})
end

local uejp = 0x8CA88B4 ~ 0xAABBCCDD
local kwzt = ztqk("libil2cpp.so", uejp ~ 0xAABBCCDD)
local raml = ndwe(kwzt, 0, 0x4)
local qowy = ndwe(raml, 0, 0x4)
local cpld = ndwe(qowy, 0x2E + 0x2E, 0x4)
local wqru = ndwe(cpld, 0, 0x4)
local ybkj = ndwe(wqru, 0x28 * 2, 0x4)
local bsht = ndwe(ybkj, 0x22 * 2, 0x4)

gg.alert("Aim [Test]")

local hvur = false

while true do
    local khvb = ndwe(bsht, 0x134, 0x4)
    local ezjw = ndwe(bsht, 0x814, 0x4)

    if bsht == 0 or khvb == 0 then
        gg.clearList()
    end

    if khvb == 1 and ezjw ~= 0 then
        local fbnu = ndwe(ezjw, 0x3D8, 0x4)
        local oxdm = ndwe(fbnu, 0x8, 0x4)
        local jtzf = ezjw + 0x32 + 0x1E

        if not hvur and fbnu ~= 0 then
            vfka(oxdm, 0x2A + 0x22, 0x10, 0)
            gg.addListItems({{address = jtzf, flags = 4, value = fbnu, freeze = true}})
            hvur = true
        end
    else
        if hvur then
            gg.clearList()
            hvur = false
        end
    end
end
