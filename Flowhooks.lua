local a="https://api.shadyretard.io/playerinfo/"
local b={"game_init","player_team","player_changename","game_end","player_disconnect"}
for c=1,#b do client.AllowListener(b[c])
end;local d={}
local e={}
local f={['topbar']=draw.CreateFont("Verdena",14),['tab']=draw.CreateFont("Tahoma",13),['button']=draw.CreateFont("Tahoma",12)}
local g={}
local h=gui.Reference("MENU")
local i,j;local k,l=618,548;local m,n=300,250;local o;local p=1;local q,r=1,0;local s,t=0,0;local u=20;local v=false;local w=gui.Checkbox(gui.Reference("SETTINGS"),"lynxclient_show_flowhooks_menu","[Lynx] Show FlowHooks PlayerList",true)
local x,y=false,0;local z=client.GetConVar("name")
local A=draw.CreateTexture()
local B=function(C)
return string.format("%%%02X",string.byte(C))
end;local function D(E)
if E==nil then return end;E=E:gsub("\n","\r\n")
    E=E:gsub("([^%w ])",B)
    E=E:gsub(" ","+")
    return E end;local function F(G,H)
    for I,J in pairs(G)
        do if H==I then return true end end;return false end;local function K(L,M,N,O)
        return i>=L and i<=N and j>=M and j<=O end;local function P(Q,R)
        local S=10^(R or 0)
        return math.floor(Q*S+0.5)/S end;local function T(U,V,W)
        if U<V then return V end;if U>W then return W end;return U end;local function X(Y,Z,_,a0,L,M,a1,a2,a3)
            if a3~=nil then draw.SetTexture(a3)
            else draw.SetTexture(Y,Z,_,a0)
            end;draw.Color(Y,Z,_,a0)
            draw.RoundedRectFill(L,M,L+a1,M+a2)
            draw.SetTexture(A)
        end;local function a4(Y,Z,_,a0,L,M,a1,a2,a3)
        if a3~=nil then draw.SetTexture(a3)
        else draw.SetTexture(Y,Z,_,a0)
        end;draw.Color(Y,Z,_,a0)
        draw.RoundedRect(L,M,L+a1,M+a2)
        draw.SetTexture(A)
    end;local function a5(Y,Z,_,a0,L,M,a1,a2,a3)
    if a3~=nil then draw.SetTexture(a3)
    end;draw.Color(Y,Z,_,a0)
    draw.FilledRect(L,M,L+a1,M+a2)
    if a3~=nil then draw.SetTexture(A)
    end end;local function a6(Y,Z,_,a0,L,M,a1,a2,a3)
    if a3~=nil then draw.SetTexture(a3)
    end;draw.Color(Y,Z,_,a0)
    draw.OutlinedRect(L,M,L+a1,M+a2)
    if a3~=nil then draw.SetTexture(A)
    end end;local function a7(Y,Z,_,a0,L,M,a1,a2,a3)
    if a3~=nil then draw.SetTexture(a3)
    end;draw.Color(Y,Z,_,a0)
    draw.OutlinedRect(L-1,M-1,L+a1+1,M+a2+1)
    if a3~=nil then draw.SetTexture(A)
    end end;local function a8(a9,aa,L,M,a1,a2,ab)
    a5(a9[1],a9[2],a9[3],a9[4],L,M,a1,a2)
    local Y,Z,_=aa[1],aa[2],aa[3]if ab then for c=1,a2 do local a0=c/a2*aa[4]a5(Y,Z,_,a0,L,M+c,a1,1)
end else for c=1,a1 do local a0=c/a1*aa[4]a5(Y,Z,_,a0,L+c,M,1,a2)
end end end;local function ac(Y,Z,_,a0,L,M,ad,ae)
if ae~=nil then draw.SetFont(ae)
end;draw.Color(Y,Z,_,a0)
if ad~=nil then draw.TextShadow(L,M,ad)
    return draw.GetTextSize(ad)
end;return 0,0 end;local function af()
if input.IsButtonDown(1)
    then i,j=input.GetMousePos()
    if v then m=i-s;n=j-t end;if K(m,n,m+k,n+u)
        then v=true;s=i-m;t=j-n end else v=false end end;local function ag(ah,ai,aj,ak)
        local al,am=m+19,n+64;if(#ah-ai)*20>=ai*20 then while(#ah-ai)*20>=ai*20 do ai=ai+1 end end;local a2=ai*20;local an=0;local ao=0;local ap=false;for c=1,#ah do local Y,Z,_=255,255,255;if ah[c].priority=="Local-Player"then Y,Z,_=72,151,147 elseif ah[c].priority=="Auto-CT"then Y,Z,_=120,220,226 elseif ah[c].priority=="Auto-T"then Y,Z,_=142,44,48 end;local ae=f['tab']local aq=am+c*20-19-ak*20;local ar=true;if aq>am+a2 then ar=false;an=an+1;ap=true elseif aq<am then ar=false;ao=ao+1;ap=true end;if ar then i,j=input.GetMousePos()
        if K(al+1,aq,al+k-54,aq+20)
            then ae=f['tab']if input.IsButtonPressed(1)
            then aj=c end end;if aj==c then ae=f['tab']a5(255,148,2,255,al+1,aq,k-54,20)
        end;ac(255,255,255,255,al+3,aq+2,ah[c].index,ae)
        ac(Y,Z,_,255,al+42,aq+2,ah[c].name,ae)
        ac(255,255,255,255,al+222,aq+2,"Auto",ae)
        ac(255,255,255,255,al+285,aq+2,"Auto",ae)
        ac(255,255,255,255,al+342,aq+2,"Auto",ae)
        ac(255,255,255,255,al+402,aq+2,ah[c].priority,ae)
        local Y,Z,_=255,255,255;local as=d["FlowHooks Visisble"]if ah[c].user~="N/A"then if as~=nil and as.checked then Y,Z,_=123,174,172 end end;ac(Y,Z,_,255,al+482,aq+2,as~=nil and not as.checked and"N/A"or ah[c].user,ae)
    end end;if ap then local at=am+ak+ak*20+1;local au=a2-(#ah-ai)*20-ak;i,j=input.GetMousePos()
    if K(m+k-34,am,m+k-34+15,am+a2)
        and input.IsButtonDown(1)
        then local av=T(j-am,0,a2)
        local aw=av/a2+av/a2/2;ak=T(math.floor((#ah-ai)*aw),0,#ah-ai)
    end;a5(65,65,65,255,m+k-34,at+1,15,au+1)
end;return aj,ak end;local function ax(L,M,a1,a2,ay)
local az=m;local aA,aB,aC=246,34,34;local Y,Z,_=102,102,102;if K(az+L,n+M,az+L+a1,n+M+a2)
then aA,aB,aC=186,0,0;Y,Z,_=238,238,238;if input.IsButtonDown(1)
then end end;local ae=f['button']a7(0,0,0,255,az+L,n+M,a1,a2)
a8({37,38,37,255},{8,10,10,255},az+L,n+M,a1,a2,true)
Y,Z,_=255,255,255;ae=f['button']draw.SetFont(ae)

local aD,aE=draw.GetTextSize(ay)
ac(Y,Z,_,255,az+L+(a1-aD)/2,n+M+(a2-aE)/2,ay,ae)
return K(az+L,n+M,az+L+a1,n+M+a2)
and input.IsButtonPressed(1)
end;local function aF(L,M,a1,a2,ay)
local az=m;local aA,aB,aC=246,34,34;local Y,Z,_=102,102,102;if K(az+L,n+M,az+L+a1,n+M+a2)
then aA,aB,aC=186,0,0;Y,Z,_=238,238,238;if input.IsButtonDown(1)
then end end;local ae=f['button']Y,Z,_=255,255,255;ae=f['button']draw.SetFont(ae)
local aD,aE=draw.GetTextSize(ay)
ac(Y,Z,_,255,az+L,n+M,ay,ae)
a7(0,0,0,255,az+L,n+M+aE+4,a1,a2)
a5(23,25,23,255,az+L,n+M+aE+4,a1,a2)
ac(Y,Z,_,255,az+L+2,n+M+a2,"Auto",ae)
a5(0,0,0,255,az+L+a1+-13,n+M+aE+4,1,a2)
a5(36,37,36,255,az+L+a1+-12,n+M+aE+4,12,a2)
a5(0,0,0,255,az+L+a1+-8,n+M+a2+aE/2,4,1)
return K(az+L,n+M,az+L+a1,n+M+a2)
and input.IsButtonPressed(1)
end;local function aG(aH,aI)
http.Get(a..D(aI),function(aJ)
if aJ==nil or aJ=="error"or F(e,aI)==true then return end;aJ=json.decode(aJ)
    aH['response']=aJ;if g[aI]==nil then http.Get(aJ["summary"]['avatar']['medium'],function(Y)
    local aK,aL,aM=common.DecodeJPEG(Y)
    local a3=draw.CreateTexture(aK,aL,aM)
    g[aI]={texture=a3,w=aL,h=aM}
end)
end end)
end;local function aN()
local aO=entities.GetLocalPlayer()
if aO==nil then return end;local aP=client.GetPlayerInfo(aO:GetIndex())
    local aQ={["index"]=aO:GetIndex(),["name"]=aO:GetName(),["steamid"]=aP["SteamID"],['priority']="Local-Player",['user']="abcd"}
    aG(aQ,aP["SteamID"])
    e={aQ}
    local aR={}
    local aH={}
    local aS={}
    for c=1,globals.MaxClients(),1 do local aT=math.floor(c)
        local aU=client.GetPlayerInfo(aT)
        local aV=client.GetPlayerNameByIndex(aT)
        if aV~=nil and aT~=aO:GetIndex()
            then if aU~=nil and aU["IsBot"]==false and F(e,aU["SteamID"])==false then if aU["IsGOTV"]==false then local aW=entities.GetPlayerResources():GetPropInt("m_iTeam",aT)
            if aW==3 then local aX={["index"]=aT,["name"]=aV,["steamid"]=aU["SteamID"],['priority']="Auto-CT",['user']="N/A"}
                table.insert(aR,aX)
                aG(aX,aU["SteamID"])
            elseif aW==2 then local aX={["index"]=aT,["name"]=aV,["steamid"]=aU["SteamID"],['priority']="Auto-T",['user']="N/A"}
                table.insert(aH,aX)
                aG(aX,aU["SteamID"])
            else local aX={["index"]=aT,["name"]=aV,["steamid"]=aU["SteamID"],['priority']="Auto",['user']="N/A"}
                table.insert(aS,aX)
                aG(aX,aU["SteamID"])
            end else local aX={["index"]=aT,["name"]=aV,["steamid"]=aU["SteamID"],['priority']="Auto",['user']="N/A"}
            table.insert(aS,aX)
            aG(aX,aU["SteamID"])
        end end end end;local aY,aZ;if aO:GetTeamNumber()==2 then aY,aZ=aH,aR else aY,aZ=aR,aH end;for c=1,#aY do table.insert(e,aY[c])
    end;for c=1,#aZ do table.insert(e,aZ[c])
end;for c=1,#aS do table.insert(e,aS[c])
end end;local function a_()
local b0={[96]="~",[49]="!",[50]="@",[51]="#",[52]="$",[53]="%",[54]="^",[55]="&",[56]="*",[57]="(",[48]=")",[57]="(",[48]=")",[45]="_",[61]="+",[91]="{",[93]="}",[92]="|",[59]=" =",[39]='"',[44]="<",[46]=">",[47]="?"}
local b1={[189]="-",[187]="=",[186]=";",[219]="[",[221]="]",[222]="'",[220]="\\",[191]="/",[188]=",",[190]="."}
local b2={[189]="_",[187]="+",[186]=";",[219]="{",[221]="}",[222]='"',[220]="|",[191]="?",[188]="<",[190]=">"}
local b3=""for c=48,90 do if input.IsButtonPressed(c)
then if not input.IsButtonDown(16)
and c>=65 and c<=90 then b3=string.char(c+32)
elseif input.IsButtonDown(16)
    and b0[c]then b3=b0[c]else b3=string.char(c)
end end end;for c=187,222 do if input.IsButtonPressed(c)
then if not input.IsButtonDown(16)
and b1[c]~=nil then b3=b1[c]elseif input.IsButtonDown(16)
and b2[c]~=nil then b3=b2[c]else b3=string.char(c)
end end end;if input.IsButtonPressed(32)
then b3=" "end;return b3 end;local function b4(L,M,a1,a2,H,ay)
local as=d[H]if as==nil then d[H]={['text']='',['selected']=false}
as=d[H]end;local az=m;local b5=f['tab']local ad=as['text']if K(az+L,n+M,az+L+a1,n+M+a2)
then if input.IsButtonDown(1)
then as['selected']=true end elseif input.IsButtonDown(1)
then as['selected']=false end;if as['selected']then if input.IsButtonPressed(8)
then as['text']=string.sub(as['text'],1,string.len(as['text'])-1)
end;local b6=a_()
if b6~=''
    then as['text']=as['text']..b6 end end;X(171,173,171,255,az+L,n+M,a1,a2)
    draw.SetFont(b5)
    local aD,aE=draw.GetTextSize(ay)
    ac(255,255,255,255,az+L+2,n+M-a2+2,ay,b5)
    local aD,aE=draw.GetTextSize(ad)
    ac(255,255,255,255,az+L+5,n+M+(a2-aE)/2,ad,b5)
    return as['text']end;local function b7(L,M,a1,a2,ay,b8)
    local as=d[ay]if as==nil then d[ay]={['checked']=b8}
    as=d[ay]end;local az=m;local Y,Z,_=24,25,24;if K(az+L,n+M,az+L+a1,n+M+a2)
    then if input.IsButtonPressed(1)
    then as.checked=not as.checked end end;local b8=as.checked;if b8 then Y,Z,_=251,146,2 end;local ae=f['tab']draw.SetFont(ae)
    local aD,aE=draw.GetTextSize(ay)
    X(Y,Z,_,255,az+L+5,n+M+5,14,14)
    ac(255,255,255,255,az+L+19+5,n+M+5+(14-aE)/2,ay,ae)
    return as.checked end;local function b9(c,ba)
    gui.SetValue("msc_namestealer_enable",c)
    gui.SetValue("msc_namestealer_interval",ba)
end;local function bb()
if x~=true then b9(1,5)
    if y==0 then y=2 end;if y>0 then y=y-globals.FrameTime()
        return end;x=true;b9(0,0)
    else client.SetConVar("name",z,false)
    end end;local function bc(G,bd)
    for J,be in ipairs(G)
        do if bd==be then return true end end;return false end;callbacks.Register("FireGameEvent","CE5355DBF57",function(bf)
        if bc(b,bf:GetName())
            then print("[FlowHooks] Updating Player List")
            aN()
        end end)
        aN()
        callbacks.Register("Draw","CD5793A7C19",function()
        local aO=entities.GetLocalPlayer()
        if aO~=nil then bb()
        else x,y=false,0 end;if not h:IsActive()
            or not w:GetValue()
            then return end;i,j=input.GetMousePos()
            a8({0,3,1,255},{11,11,11,255},m,n,k,l,true)
            local ae=f['topbar']draw.SetFont(ae)
            local aD,J=draw.GetTextSize("Player List")
            ac(255,255,255,255,m+(k-aD)/2,n+3,"Player List",ae)
            a8({43,43,43,255},{46,46,46,255},m+10,n+20,k-20,l-30,true)
            a8({52,52,52,255},{59,59,59,255},m+10,n+20,k-20,20,true)
            a5(0,0,0,255,m+10,n+40,k-20,1)
            if o==nil then o={}
                local bg=
                {
                    
                    'Players','Views',"Records"
                }
                
                for c,be in ipairs(bg)
                    do table.insert(o,{['text']=be,['selected']=c==1,['hover']=false})
                end end;local bh=m+10;for c,be in ipairs(o)
                do local bi=f['tab']local bj=be.text;local bk,bl,bm,
                bn=27,27,27,255;
                if c==p then bk,bl,bm,bn=45,45,45,255 elseif be['hover']then bk,bl,bm,bn=45,45,45,be['hoverAlpha']end;draw.SetFont(bi)
                    local aD,bo=draw.GetTextSize(bj)
                    if K(bh,n+20,bh+16+aD,n+40)
                        then if input.IsButtonPressed(1)
                        then p=c end;be['hover']=true else be['hover']=false end;if c==p then a7(0,0,0,255,bh,n+20,15+aD,20)
                    end;a5(bk,bl,bm,bn,bh,n+20,(c==p and 15 or 16)+aD,c==p and 21 or 20)
                    if c==p then a5(237,153,23,255,bh,n+20,15+aD,2)
                    end;ac(255,255,255,255,bh+8,n+20+(20-bo)/2,bj,bi)
                    bh=bh+16+aD end;if p==1 then a7(0,0,0,255,m+19,n+49,k-38,198)
                    a5(65,65,65,255,m+19,n+49,k-38,13)
                    a5(0,0,0,255,m+19,n+62,k-38,1)
                    a5(24,24,24,255,m+19,n+62,k-38,185)
                    local bi=f['tab']local bp=m+25;local aD,J=draw.GetTextSize("Index")
                    ac(255,255,255,255,bp,n+49,"Index",bi)
                    local bp=bp+aD+5;a5(0,0,0,255,bp,n+49,1,13)
                    local bp=bp+64;local aD,J=draw.GetTextSize("Username")
                    ac(255,255,255,255,bp,n+49,"Username",bi)
                    local bp=bp+aD+65;a5(0,0,0,255,bp,n+49,1,13)
                    local bp=bp+8;local aD,J=draw.GetTextSize("Hitgroup")
                    ac(255,255,255,255,bp,n+49,"Hitgroup",bi)
                    local bp=bp+aD+9;a5(0,0,0,255,bp,n+49,1,13)
                    local bp=bp+10;local aD,J=draw.GetTextSize("R-Pitch")
                    ac(255,255,255,255,bp,n+49,"R-Pitch",bi)
                    local bp=bp+aD+11;a5(0,0,0,255,bp,n+49,1,13)
                    local bp=bp+15;local aD,J=draw.GetTextSize("R-Yaw")
                    ac(255,255,255,255,bp,n+49,"R-Yaw",bi)
                    local bp=bp+aD+14;a5(0,0,0,255,bp,n+49,1,13)
                    local bp=bp+22;local aD,J=draw.GetTextSize("Priority")
                    ac(255,255,255,255,bp,n+49,"Priority",bi)
                    local bp=bp+aD+23;a5(0,0,0,255,bp,n+49,1,13)
                    local bp=bp+20;ac(255,255,255,255,bp,n+49,"FH-User",bi)
                    a5(0,0,0,255,m+k-34,n+49,15,198)
                    local aR={}
                    local aH={}
                    local aS={}
                    local aO=entities.GetLocalPlayer()
                    if aO~=nil then q,r=ag(e,9,q,r)
                        a7(0,0,0,255,m+19,n+265,k-38,262)
                        local aD,aE=draw.GetTextSize("Player Settings")
                        a5(45,45,45,255,m+24,n+264,aD,1)
                        ac(255,255,255,255,m+24,n+265-aE/2,"Player Settings",bi)
                        a7(0,0,0,255,m+26,n+279,279,206)
                        local aD,aE=draw.GetTextSize("Info")
                        a5(45,45,45,255,m+31,n+279,aD,1)
                        ac(255,255,255,255,m+31,n+279-aE/2,"Info",bi)
                        a7(0,0,0,255,m+314,n+279,279,206)
                        local aD,aE=draw.GetTextSize("Controls")
                        a5(45,45,45,255,m+319,n+279,aD,1)
                        ac(255,255,255,255,m+319,n+279-aE/2,"Controls",bi)
                        local bq=e[q]local J,aE=ac(255,255,255,255,m+31,n+289,"Name: "..bq.name)
                        local br=n+289+aE+10;local J,aE=ac(255,255,255,255,m+31,br,"Clan: ")
                        br=br+aE+10;local aJ=bq['response']local bs="00000000000000000"if aJ~=nil then local bt=aJ["summary"]if bt~=nil then bs=bt.steamID end end;local bu=g[bq.steamid]local J,aE=ac(255,255,255,255,m+31,br,"Steam64: "..bs)
                        br=br+aE+10;local bv=entities.GetByIndex(bq.index)
                        local L,M,bw;if bv~=nil then L,M,bw=bv:GetProp('m_vecOrigin')
                    end;if L~=nil and M~=nil and bw~=nil then L,M,bw=math.floor(L),math.floor(M),math.floor(bw)
                else L,M,bw=0,0,0 end;local J,aE=ac(255,255,255,255,m+31,br,"Origin: "..string.format("( %d, %d, %d )",L,M,bw))
                    br=br+aE+10;local bx,by,bz;if bv~=nil then bx,by,bz=bv:GetProp('m_angEyeAngles')
                end;if bx~=nil and by~=nil then bx,by=P(bx,2),P(by,2)
            else bx,by=0,0 end;local J,aE=ac(255,255,255,255,m+31,br,"Angles: "..string.format("( %g, %g )",bx,by))
                br=br+aE+10;local bA=entities.GetPlayerResources():GetProp("m_iCompetitiveRanking",bq.index)
                if bA==0 or bA==0.0 then bA="N/A"end;local J,aE=ac(255,255,255,255,m+31,br,"Competitive Rank: "..bA)
                    br=br+aE+10;local bB=entities.GetPlayerResources():GetProp("m_iCompetitiveWins",bq.index)
                    local J,aE=ac(255,255,255,255,m+31,br,"Competitive Wins: "..math.floor(bB))
                    local bC=18;br=289;local bD=ax(298-68,br,68,bC,"Steal Name")
                    if bD then z='​'..bq.name end;br=br+bC+5;local bE=ax(298-68,br,68,bC,"Steal Clan")
                        br=br+bC+5;local bF=ax(298-68,br,68,bC,"Visit Profile")
                        br=br+bC+5;if bu~=nil then a5(255,255,255,255,m+298-64,n+br,bu.w,bu.h,bu.texture)
                        a7(0,0,0,255,m+298-64,n+br,bu.w,bu.h)
                        br=br+bu.w+6 end;local bG=ax(298-68,br,68,bC,"Vote Kick")
                        if bG then 
                            local aU=client.GetPlayerInfo(bq.index)
                            client.Command("callvote kick "..aU['UserID'])
                        end;br=289;ax(320,br,68,bC,"Set Friend")
                        ax(350+68,br,68,bC,"Set Rage")
                        ax(370+150,br,68,bC,"Set Neutral")
                        br=289+bC+15;aF(320,br,68,bC,"Hitgroup")
                        aF(350+68,br,68,bC,"Pitch-Fix")
                        aF(370+150,br,68,bC,"Yaw-Fix")
                        b4(319,279-8+206-(bC+bC+7),279-20,bC,"Comment","Comment")
                        ax(319,279-8+206-bC,279-20,bC,"Save Record")
                        b7(20,279-8+262-(bC+bC+11),68,bC,"Steam Friends",false)
                        b7(20,279-8+262-(bC+11),68,bC,"FlowHooks Visisble",true)
                    end end;af()
                end)