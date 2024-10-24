from django.db import models

# Create your models here.

class login_table(models.Model):
    username=models.CharField(max_length=100)
    password=models.CharField(max_length=100)
    type=models.CharField(max_length=100)


class room_table(models.Model):
    room_no=models.IntegerField()
    floor=models.IntegerField()
    Dimention=models.CharField(max_length=100)
    Wifi=models.CharField(max_length=100)
    status=models.CharField(max_length=100)



class shop_table(models.Model):
    login=models.ForeignKey(login_table,on_delete=models.CASCADE)
    owner=models.CharField(max_length=100)
    Name=models.CharField(max_length=100)
    Photo=models.FileField()
    Details=models.CharField(max_length=100)
    Phone=models.BigIntegerField()
    Email=models.CharField(max_length=100)
    room_id=models.ForeignKey(room_table,on_delete=models.CASCADE)



class user_table(models.Model):
    login = models.ForeignKey(login_table,on_delete=models.CASCADE)
    Name = models.CharField(max_length=100)
    place= models.CharField(max_length=100)
    post= models.CharField(max_length=100)
    pin=models.IntegerField()
    phone=models.BigIntegerField()
    Email = models.CharField(max_length=100)
    Photo = models.FileField()


class feedback_table(models.Model):
    User = models.ForeignKey(user_table, on_delete=models.CASCADE)
    feedback=models.CharField(max_length=100)
    rating=models.FloatField()
    date=models.DateField()


class complaint_table(models.Model):
    User = models.ForeignKey(user_table, on_delete=models.CASCADE)
    complaint=models.CharField(max_length=100)
    date=models.DateField()
    reply=models.CharField(max_length=100)


class rating_table(models.Model):
    User = models.ForeignKey(user_table, on_delete=models.CASCADE)
    shop = models.ForeignKey(shop_table, on_delete=models.CASCADE)
    rating=models.FloatField()
    date=models.DateField()


class route_table(models.Model):
    from_id= models.ForeignKey(room_table, on_delete=models.CASCADE,related_name="fid")
    to_id= models.ForeignKey(room_table, on_delete=models.CASCADE,related_name="tid")
    route=models.CharField(max_length=100)


class product_table(models.Model):
    shop = models.ForeignKey(shop_table, on_delete=models.CASCADE)
    product=models.CharField(max_length=100)
    price=models.FloatField()
    stock=models.IntegerField()
    image=models.FileField()


class offer_table(models.Model):
    product = models.ForeignKey(product_table, on_delete=models.CASCADE)
    offer_price=models.FloatField()
    start_date=models.DateField()
    end_date=models.DateField()


class order_table(models.Model):
    User = models.ForeignKey(user_table, on_delete=models.CASCADE)
    date=models.DateField()
    quantity=models.FloatField()
    amount=models.FloatField()
    status=models.CharField(max_length=100)


class payment_table(models.Model):
    order = models.ForeignKey(order_table, on_delete=models.CASCADE)
    amount=models.FloatField()
    User = models.ForeignKey(user_table, on_delete=models.CASCADE)
    date=models.DateField()


class order_details_table(models.Model):
    order = models.ForeignKey(order_table, on_delete=models.CASCADE)
    product = models.ForeignKey(product_table, on_delete=models.CASCADE)
    quantity=models.FloatField()
    amount=models.FloatField()
    status=models.CharField(max_length=100)
    date=models.DateField()








