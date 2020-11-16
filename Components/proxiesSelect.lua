function proxiesSelect(a1)
  if a1 == "r"
  then

    os.execute([[curl http://127.0.0.1:9090/proxies | sed -E 's/Selector/Selector\n/g' | sed '$d' | sed -E 's/.*name":"(.*)","now":"(.*)","type.*/\1\n"name":"\2"/' > ]]..path0.."files/proxiesSelect.txt")
    if file("files/proxiesSelect.txt")~=""
    then print("节点选择已保存")
    else print("保存失败，啥都没存上")
    end

  elseif a1 == "w"
  then

    if file("files/proxiesSelect.txt")~=""
    then
      local group, selector, a, i = {}, {}, a or 0, i or 0
      for ccc in io.lines(path0.."files/proxiesSelect.txt") do
        if a == 0 then 
          a = 1
          i = i + 1
          group[i]=urlEncode(ccc)
          --print(group[i])
        else
          a = 0
          selector[i]=ccc
          os.execute([[curl -v -X PUT -d '{]]..selector[i]..[[}' '127.0.0.1:9090/proxies/]]..group[i].."'")
        end
      end
      if gv.proxiesSelectNotice~=nil
      then
        print(gv.proxiesSelectNotice or "节点选择已恢复")
        gv.proxiesSelectNotice=nil

      end
    else
      print("尝试恢复节点失败：记录为空")
    end
  end
end
