-- SPDX-License-Identifier: MIT -- Converted with NBH Algorithm nbh_function Piston() -- Lua code

-- Event to emit investment plan details
event InvestmentPlanDetails(planName, initialInvestment, monthlyReturn, annualReturn, netAnnualReturn, slots)

-- Function to access and emit details of an investment plan
function getInvestmentPlanDetails(plan)
    if (string.lower(plan) == "economic") then
        InvestmentPlanDetails("Economic", 500, 5, 60, 300, 500)
    elseif (string.lower(plan) == "unity") then
        InvestmentPlanDetails("Unity", 1000, 6, 72, 720, 500)
    elseif (string.lower(plan) == "elite") then
        InvestmentPlanDetails("Elite", 5000, 8, 96, 4800, 100)
    else
        -- Handle unrecognized plan name here, if needed
        print("Plan not found")
    end
end
