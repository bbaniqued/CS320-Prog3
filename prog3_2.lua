stack = {}
top = 0

function spush(data)
    top = top + 1
    table.insert(stack, top, data)
end

function spop()
    if (top == 0) then 
        print("ERORR: CANNOT SPOP() WITH SIZE = 0")
        return nil
    end
    top = top - 1
    return table.remove(stack, top + 1)
end

function speek() return stack[top] end

function ssize() return top end


-- Queue
queue = {}
size = 0

function qpush(data)
    size = size + 1
    table.insert(queue, size, data)
end

function qpop()
    if (size == 0) then 
        print("ERORR: CANNOT QPOP() WITH SIZE = 0")
        return nil
    end
    size = size - 1
    return table.remove(queue, 1)
end

function qsize() return size end


-- InfixToPostfix helper functions
function isOperator(token)
    return (token == "*") 
        or (token == "/")  
        or (token == "+")  
        or (token == "-") 
        or (token == "%")
end

function precedence(operator)
    if (operator == '*' or operator == '/' or operator == '%') then
        return 2
    end
    if (operator == '+' or operator == '-') then
        return 1
    end
    -- funtion will return before this line if input is valid
    print("ERORR: CANNOT GET PRECEDENCE OF NON-OPERATOR")
end

function handleOperator(operator)
    if (ssize() > 0) then
        if precedence(operator) > precedence(speek()) then
            spush(operator)
        else
            qpush(spop())
            handleOperator(operator)
        end
    else
        spush(operator)
    end
end

function InfixToPostfix(input)
    -- Deliminate by ' '
    for x in string.gmatch(input, "[^%s]+") do
        -- Convert infix to postfix
        if not isOperator(x) then
            qpush(x)
        else
           handleOperator(x)
        end
    end

    while (ssize() > 0) do
        qpush(spop())
    end

    -- Build return string
    ret = ""
    for k,v in ipairs(queue) do
        ret = ret.." "..v
    end
    return ret
end

-- Input string
input = io.read()
-- print(InfixToPostfix(input))
print("Assignment #3-2, Brandon Baniqued, brandon.baniqued@gmail.com")
return InfixToPostfix(input)


