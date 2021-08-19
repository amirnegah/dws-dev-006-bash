# dws-dev-006-bash
DWSCLASS Bash Training

# try
This is a program that accepts inputs such as:
try -i INTERVAL -n NUMBER Command
Then, a for loop was written with an extra parameter "x" from 1 till "n" that is the argument 4.
Arguments from 5 until end of inputs was taken as a command. If the exit code is 0, everything is OK and the program breaks the for loop.
If the exit code is not 0, the if statement starts working and tries to run the command again. If not successful, it shows the number of attempts. If the program does not work successfully, it waits as long as the value of argument 2 and tries again.
The loop is done until the command is executed or the number of attempts is completed.

---

# try2
This program is similar to "try" application but all input states are considered in "try2". In this program, 2 default values were defined based on the question.
Then, the input string was inserted into ARGS. Afterwards, a case was written to look for "i" as an interval and "n" as the number of attempts.
If neither interval value in input string nor that in ENV exists, parameter DEFAULT_INTERVAL will be used. Otherwise, the program uses TRY_INTERVAL value in ENV.
The same was done for the number variable. I have defined DEFAULT_NUMBER in the beginning in case that TRY_NUMBER value does not exist in ENV.
The rest was done the same as "try".


[@dwsclass](https://github.com/dwsclass) dws-dev-006-bash
