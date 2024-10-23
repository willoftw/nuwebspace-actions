#!/bin/sh
echo "Deploying..."

expect -c "
spawn ssh -L 2222:localhost:22 nuwebspace
expect {
    \"Are you sure you want to continue connecting\" { 
        send "yes"\r
        exp_continue
    }
    \"$NUSPACE_USR@nuwebspace.co.uk's password: \" {
        send $NUSPACE_PWD\r
        exp_continue
    }
    \"$NUSPACE_USR@$NUSPACE_USR's password: \" {
        send $NUSPACE_PWD\r
    }
}
exit
expect eof
"

expect -c "
spawn scp -r website/ $NUSPACE_USR@nuwebspace:./public_html
expect {
    \"Are you sure you want to continue connecting\" { 
        send "yes"\r
        exp_continue
    }
    \"$NUSPACE_USR@nuwebspace.co.uk's password: \" {
        send $NUSPACE_PWD\r
        exp_continue
    }
    \"$NUSPACE_USR@$NUSPACE_USR's password: \" {
        send $NUSPACE_PWD\r
    }
}
expect eof
"