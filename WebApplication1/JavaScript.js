function isNumber(event)
{
    var charCode = (event.which) ? event.which : event.keyCode;

    if ((charCode == true) && (charCode < 48 || charCode > 57) && (charCode !== 46))
    {
        return false;
    }

    else
    {
        return true;
    }
}