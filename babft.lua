local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
function dec(data)
    data = string.gsub(data, '[^'..b..'=]', '')
    return (data:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
        return r;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if (#x ~= 8) then return '' end
        local c=0
        for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
        return string.char(c)
    end))
end
loadstring(dec('bG9jYWwgZ3VpID0gSW5zdGFuY2UubmV3KCJTY3JlZW5HdWkiKQpndWkuUGFyZW50ID0gZ2FtZS5Db3JlR3VpCgpsb2NhbCBmcmFtZSA9IEluc3RhbmNlLm5ldygicmFtZSIpCmZyYW1lLlBhcmVudCA9IGd1aQpmcmFtZS5TaXplID0gVURpbTIubmV3KDAsIDI1MCwgMCwgMTIwKQpmcmFtZS5Qb3NpdGlvbiA9IFVEaW0yLm5ldygwLjUsIC0xMjUsIDAuNSwgLTYwKQpmcmFtZS5CYWNrZ3JvdW5kQ29sb3IzID0gQ29sb3IzLmZyb21SR0IoNjAsIDYwLCA2MCkKZnJhbWUuQm9yZGVyU2l6ZVBpeGVsID0gMAoKbG9jYWwgVXNlcklucHV0U2VydmljZSA9IGdhbWU6R2V0U2VydmljZSgiVXNlcklucHV0U2VydmljZSIpCmxvY2FsIGRyYWdnaW5nLCBkcmFnSW5wdXQsIGRyYWdTdGFydCwgc3RhcnRQb3MKbG9jYWwgZnVuY3Rpb24gdXBkYXRlKGlucHV0KQogICAgbG9jYWwgZGVsdGEgPSBpbnB1dC5Qb3NpdGlvbiAtIGRyYWdTdGFydAogICAgZnJhbWUuUG9zaXRpb24gPSBVRGltMi5uZXcoCiAgICAgICAgc3RhcnRQb3MuWFNjYWxlLCBzdGFydFBvcy5YT2Zmc2V0ICsgZGVsdGEuWCwKICAgICAgICBzdGFydFBvcy5ZU2NhbGUsIHN0YXJ0UG9zLllPZmZzZXQgKyBkZWx0YS5ZCiAgICApCmVuZApmcmFtZS5JbnB1dEJlZ2FuOkNvbm5lY3QoZnVuY3Rpb24oaW5wdXQpCiAgICBpZiBpbnB1dC5Vc2VySW5wdXRUeXBlID09IEVudW0uVXNlcklucHV0VHlwZS5Nb3VzZUJ1dHRvbjEgb3IgaW5wdXQuVXNlcklucHV0VHlwZSA9PSBFbnVtLlVzZXJJbnB1dFR5cGUuVG91Y2ggdGhlbgogICAgICAgIGRyYWdnaW5nID0gdHJ1ZQogICAgICAgIGRyYWdTdGFydCA9IGlucHV0LlBvc2l0aW9uCiAgICAgICAgc3RhcnRQb3MgPSBmcmFtZS5Qb3NpdGlvbgogICAgICAgIGlucHV0LkNoYW5nZWQ6Q29ubmVjdChmdW5jdGlvbigpCiAgICAgICAgICAgIGlmIGlucHV0LlVzZXJJbnB1dFN0YXRlID09IEVudW0uVXNlcklucHV0U3RhdGUuRW5kIHRoZW4KICAgICAgICAgICAgICAgIGRyYWdnaW5nID0gZmFsc2UKICAgICAgICAgICAgZW5kCiAgICAgICAgZW5kKQogICAgZW5kCmVuZCkKZnJhbWUuSW5wdXRDaGFuZ2VkOkNvbm5lY3QoZnVuY3Rpb24oaW5wdXQpCiAgICBpZiBpbnB1dC5Vc2VySW5wdXRUeXBlID09IEVudW0uVXNlcklucHV0VHlwZS5Nb3VzZU1vdmVtZW50IG9yIGlucHV0LlVzZXJJbnB1dFR5cGUgPT0gRW51bS5Vc2VySW5wdXRUeXBlLlRvdWNoIHRoZW4KICAgICAgICBkcmFnSW5wdXQgPSBpbnB1dAogICAgZW5kCmVuZCkKVXNlcklucHV0U2VydmljZS5JbnB1dENoYW5nZWQ6Q29ubmVjdChmdW5jdGlvbihpbnB1dCkKICAgIGlmIGlucHV0ID09IGRyYWdJbnB1dCBhbmQgZHJhZ2dpbmcgdGhlbgogICAgICAgIHVwZGF0ZShpbnB1dCkKICAgIGVuZCplbmQpCgpsb2NhbCB0aXRsZSA9IEluc3RhbmNlLm5ldygidGV4dGxhYmVsIikKdGl0bGUuUGFyZW50ID0gZnJhbWUKdGl0bGUuU2l6ZSA9IFVEaW0yLm5ldygxLCAwLCAwLCAzMCkKdGl0bGUuUG9zaXRpb24gPSBVRGltMi5uZXcoMCwgMCwgMCwgMCkKdGl0bGUuQmFja2dyb3VuZFRyYW5zcGFyZW5jeSA9IDEKdGl0bGUuVGV4dCA9ICJtYWRlIGJ5IGkgd2FudCB0byBiZSBmYW1vdXNlIg=='))()
