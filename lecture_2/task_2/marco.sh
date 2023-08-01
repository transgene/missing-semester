marco()
{
    pwd > /tmp/marco_pwd
}

polo()
{
    if [ -f /tmp/marco_pwd ] ; then
        cd $(< /tmp/marco_pwd)
    fi
}

