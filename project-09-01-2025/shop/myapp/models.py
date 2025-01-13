from django.db import models
from django.db import models
class login(models.Model):
    username=models.CharField(max_length=100)
    password=models.CharField(max_length=100)
    usertype=models.CharField(max_length=100)


class users(models.Model):
    uname=models.CharField(max_length=100)
    uemail=models.CharField(max_length=100)
    housename=models.CharField(max_length=100)
    town=models.CharField(max_length=100)
    pin=models.IntegerField()
    uphone=models.BigIntegerField()
    upassword=models.CharField(max_length=100)
    LOGIN=models.ForeignKey(login,default=1,on_delete=models.CASCADE)
    def __str__(self):
        return self.uname

class product(models.Model):
    pname=models.CharField(max_length=100)
    psize=models.CharField(max_length=100)
    category=models.CharField(max_length=100)
    pamount=models.IntegerField()
    pphoto=models.ImageField(upload_to='media')
    sizephoto=models.ImageField(upload_to='media')
    def __str__(self):
        return self.pname
class cart(models.Model):
    NAME=models.ForeignKey(product,default=1,on_delete=models.CASCADE)
    quantity=models.IntegerField()
    csize=models.CharField(max_length=100)
    USERS=models.ForeignKey(users,default=1,on_delete=models.CASCADE)


class order_master(models.Model):
  USERS=models.ForeignKey(users,default=1,on_delete=models.CASCADE)
  camount=models.IntegerField()
  odate=models.DateField(max_length=100)
  status=models.CharField(max_length=100)


class order(models.Model):
  PRODUCT=models.ForeignKey(product,default=1,on_delete=models.CASCADE)
  oquantity=models.IntegerField()
  osize=models.CharField(max_length=100)
  ORDER_MASTER=models.ForeignKey(order_master,default=1,on_delete=models.CASCADE)

class feedback(models.Model):
    feedbacks=models.CharField(max_length=100)
    fdate=models.CharField(max_length=100)
    USERS=models.ForeignKey(users,default=1,on_delete=models.CASCADE)
    PRODUCT=models.ForeignKey(product,default=1,on_delete=models.CASCADE)
    rating = models.IntegerField(choices=[(i, int(i)) for i in range(1, 6)])     


class wishlist(models.Model):
    USERS=models.ForeignKey(users,default=1,on_delete=models.CASCADE)
    PRODUCT=models.ForeignKey(product,default=1,on_delete=models.CASCADE)


class staff(models.Model):
    sname=models.CharField(max_length=100)
    semail=models.CharField(max_length=100)
    address=models.CharField(max_length=100)
    sphone=models.BigIntegerField()
    spassword=models.CharField(max_length=100)
    sphoto=models.ImageField(upload_to='media')
    LOGIN=models.ForeignKey(login,default=1,on_delete=models.CASCADE)

    def __str__(self):
        return self.sname

    
class delivery(models.Model):
    fname=models.CharField(max_length=100)
    lname=models.CharField(max_length=100)
    phone=models.BigIntegerField()
    pin=models.IntegerField()
    address = models.CharField(max_length=10000)
    locality = models.CharField(max_length=200)
    district = models.CharField(max_length=200)
    state = models.CharField(max_length=200)
    other = models.CharField(max_length=10000)
    ORDER_MASTER=models.ForeignKey(order_master,default=1,on_delete=models.CASCADE)


    
    

