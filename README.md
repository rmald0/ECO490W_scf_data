# How Does Financial Literacy Affect Retirement Savings Accounts?
Regression analysis conducted for my research paper on the relationship between financial literacy and retirement savings. 
The most recent Survey of Consumer Finances summary extract dataset (SCFP2022.csv) is used.
Financial Literacy, is proxied by the correct number of "Big Three" questions answered correctly.
Self reported knowledge of personal finances is also examined and an interaction term between the two is used. 
I ran two regressions. The dependent variables are LTHRIFT (log of Thrift, 401(k) and 401(b) account balances) and LIRAKH (log of IRA/Keough account balances).
THRIFT and 401 accounts are employer sponsored accounts, Whereas IRA/Keough are usually for self employed individuals.
Independent variables include binary indicators of financial literacy and self assessed financial knowledge, as well as controls for age, education, employment status,
income, and race. 
## FINDINGS:
Financial Literacy is a key factor for retirement savings. Financially literate individuals have significantly higher retirement savings compared to those who are not financially
literate. For LTHRIFT, financial literacy increased pension accounts by 164%, and LIRAKH account balances by 121%.
Interestingly, KNOWL was less significant than FINLIT, but still significant in both models. 
Respondents with higher self-reported knowledge had 60% higher balances in LTHRIFT and 74% in LIRAKH.
This suggests actual knowledge is a better indicator of higher savings than self-reported knowledge.
The interaction term between KNOWL and FINLIT was negative in LTHRIFT (-100%), yet positive in LIRAKH (63.2%). 
Thia is likely because financially literate and knowledgeable individuals are more likely to invest into an account that can be personally managed and does not need an employer.
This is reinforced by the fact that having stocks was a more positive indicator of higher balances in LIRAKH (200%) compared to LTHRIFT (51.7%). 

