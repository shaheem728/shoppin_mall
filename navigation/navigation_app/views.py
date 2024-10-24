from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse
from django.shortcuts import render

# Create your views here.
from navigation_app.models import *


def login(request):
    return render(request,"admin/login.html")

def logout(request):
    return render(request,"admin/login.html")



def login_post(request):
    try:
        username = request.POST['textfield']
        password = request.POST['textfield2']
        login_obj = login_table.objects.get(username=username,password=password)
        if login_obj.type == "admin":
            return HttpResponse('''<script> alert("Welcome to admin home"); window.location="adminhome"</script>''')

        elif login_obj.type == "shop":
            request.session['shop_lid']=login_obj.id
            return HttpResponse('''<script> alert("Welcome to shop home"); window.location="shophome"</script>''')
        else:
            return HttpResponse('''<script> alert("Invalid username or password"); window.location="/"</script>''')
    except:
        return HttpResponse('''<script> alert("Invalid username or password"); window.location="/"</script>''')


def signup(request):
    obj=room_table.objects.all()
    return render(request,"admin/sign up.html", {'val': obj})



def signup_post(request):
    Name = request.POST['textfield']
    photo = request.FILES['file']
    fss = FileSystemStorage()
    photo_file = fss.save(photo.name, photo)
    Details = request.POST['textfield2']
    Owner = request.POST['textfield3']
    Phone = request.POST['textfield4']
    Email = request.POST['textfield5']
    Room = request.POST['select']
    Username = request.POST['textfield6']
    Password = request.POST['textfield7']

    login_obj=login_table()
    login_obj.username=Username
    login_obj.password=Password
    login_obj.type='pending'
    login_obj.save()

    shop_obj=shop_table()
    shop_obj.owner=Owner
    shop_obj.Name = Name
    shop_obj.Photo=photo_file
    shop_obj.Details=Details
    shop_obj.Phone=Phone
    shop_obj.Email=Email
    shop_obj.room_id=room_table.objects.get(id=Room)
    shop_obj.login=login_obj
    shop_obj.save()


    return HttpResponse('''<script> alert("Registration successfully"); window.location="/"</script>''')


def adminhome(request):
    return render(request,"admin/adminindex.html")


def verifyshop(request):
    shop_obj = shop_table.objects.all()
    return render(request,"admin/view and verify shop.html", {'val': shop_obj})


def verifyshop_search(request):
    search = request.POST['textfield']
    shop_obj = shop_table.objects.filter(Name__istartswith=search)
    if not shop_obj:
        return HttpResponse('''<script> alert("shop not found"); window.location="/verifyshop"</script>''')
    else:
        return render(request,"admin/view and verify shop.html", {'val': shop_obj, 'val1': search})

def accept_shop(request, id):
    shop_obj = shop_table.objects.get(id=id)
    login_obj = login_table.objects.get(id=shop_obj.login.id)
    login_obj.type = "shop"
    login_obj.save()
    return HttpResponse('''<script> alert("shop accepted"); window.location="/verifyshop"</script>''')

def reject_shop(request, id):
    shop_obj = shop_table.objects.get(id=id)
    login_obj = login_table.objects.get(id=shop_obj.login.id)
    login_obj.type = "reject"
    login_obj.save()
    return HttpResponse('''<script> alert("shop rejected"); window.location="/verifyshop"</script>''')

def viewcompliant(request):
    complaint_obj = complaint_table.objects.all()
    return render(request,"admin/view compliants.html", {'val': complaint_obj})

def viewcompliant_search(request):
    search = request.POST['date']
    search_obj = complaint_table.objects.filter(date=search)
    if not search_obj:
        return HttpResponse('''<script> alert("date not found"); window.location="/viewcompliant"</script>''')
    else:
        return render(request, "admin/view compliants.html", {'val': search_obj,'val1':search})


def sendreply(request, id):
    request.session['com_id'] = id
    return render(request,"admin/send reply.html")

def sendreply_post(request):
    reply = request.POST['textfield']
    comp_obj = complaint_table.objects.get(id=request.session['com_id'])
    comp_obj.reply = reply
    comp_obj.save()
    return HttpResponse('''<script> alert("reply send"); window.location="/viewcompliant"</script>''')


def viewfeedback(request):
    feedback_obj = feedback_table.objects.all()
    return render(request,"admin/Viewfeedback.html",{'val':feedback_obj})

def feedback_search(request):
    search = request.POST['date']
    search_obj = feedback_table.objects.filter(date=search)
    if not search_obj:
        return HttpResponse('''<script> alert("date not found"); window.location="/viewfeedback"</script>''')
    else:
        return render(request, "admin/Viewfeedback.html", {'val': search_obj, 'val1':search})

def viweshoprating(request):
    shoprating_obj = rating_table.objects.all()
    shop_obj = shop_table.objects.all()
    return render(request,"admin/View shop rating.html",{'val':shoprating_obj, 'val1':shop_obj})

def rating_search(request):
    search = request.POST['select']
    shop_obj = shop_table.objects.all()
    search_obj = rating_table.objects.filter(shop_id=search)

    return render(request, "admin/View shop rating.html", {'val': search_obj,'val1':shop_obj})



def manageroom(request):
    manageroom_obj = room_table.objects.all()
    return render(request,"admin/manageroom.html",{'val':manageroom_obj})

def manageroom_search(request):
    search = request.POST['textfield']
    room_obj = room_table.objects.filter(floor=search)
    return render(request,"admin/manageroom.html",{'val':room_obj})


def addroom(request):
    return render(request,"admin/add room.html")

def addroom_post(request):
    Floor = request.POST['textfield']
    Room_no = request.POST['textfield2']
    Dimension = request.POST['textfield3']
    Wifi = request.POST['textfield4']
    Status = request.POST['select']

    room_obj = room_table()
    room_obj.room_no = Room_no
    room_obj.floor = Floor
    room_obj.Dimention = Dimension
    room_obj.Wifi = Wifi
    room_obj.status = Status
    room_obj.save()

    return HttpResponse('''<script> alert("room added"); window.location="/manageroom"</script>''')


def manageroute(request):
    ob=route_table.objects.all()
    return render(request,"admin/manageroute.html",{"val":ob})

def addroute(request):
    ob=room_table.objects.all()
    return render(request,"admin/Addroute.html",{"val":ob})


def insert_root(request):

    f=request.POST['select']
    t=request.POST['select2']
    r=request.POST['textfield']
    ob=route_table()
    ob.from_id=room_table.objects.get(id=f)
    ob.to_id=room_table.objects.get(id=t)
    ob.route=r
    ob.save()
    return HttpResponse('''<script> alert("Inserted"); window.location="/manageroute"</script>''')

def edit_route(request, id):
    request.session['id'] = id
    ob = room_table.objects.all()
    route_obj = route_table.objects.get(id=id)
    return render(request, "admin/edit route.html", {'val':route_obj, 'val1': ob})

def editroute_post(request):
    f_id = request.POST['select']
    t_id = request.POST['select2']
    route = request.POST['textfield']

    ob = route_table.objects.get(id=request.session['id'])
    ob.from_id = room_table.objects.get(id=f_id)
    ob.to_id = room_table.objects.get(id=t_id)
    ob.route = route
    ob.save()

    return HttpResponse('''<script> alert("route edited"); window.location="/manageroute"</script>''')

def delete_route(request, id):
    route_obj = route_table.objects.get(id=id)
    route_obj.delete()

    return HttpResponse('''<script> alert("route deleted"); window.location="/manageroute"</script>''')



def edit_room(request, id):
    request.session['room_id'] = id
    room_obj = room_table.objects.get(id=id)
    return render(request, "admin/edit room.html", {'val':room_obj})

def editroom_post(request):
    Floor = request.POST['textfield']
    Room_no = request.POST['textfield2']
    Dimension = request.POST['textfield3']
    Wifi = request.POST['textfield4']
    Status = request.POST['select']

    room_obj = room_table.objects.get(id=request.session['room_id'])
    room_obj.room_no = Room_no
    room_obj.floor = Floor
    room_obj.Dimention = Dimension
    room_obj.Wifi = Wifi
    room_obj.status = Status
    room_obj.save()

    return HttpResponse('''<script> alert("room edited"); window.location="/manageroom"</script>''')

def delete_room(request, id):
    room_obj = room_table.objects.get(id=id)
    room_obj.delete()

    return HttpResponse('''<script> alert("room deleted"); window.location="/manageroom"</script>''')

def shophome(request):
    return render(request,"shop/shopindex.html")

def manageproduct(request):
    manageproduct_obj = product_table.objects.filter(shop__login_id=request.session['shop_lid'])
    return render(request,"shop/Manage product.html", {'val': manageproduct_obj})

def addproduct(request):
    return render(request,"shop/Add product.html")

def addproduct_post(request):
    Product = request.POST['textfield']
    Price = request.POST['textfield2']
    Stock = request.POST['textfield3']
    photo = request.FILES['file']
    fa = FileSystemStorage()
    photo_file = fa.save(photo.name, photo)

    product_obj = product_table()
    product_obj.product = Product
    product_obj.stock = Stock
    product_obj.price = Price
    product_obj.image = photo_file
    product_obj.shop = shop_table.objects.get(login_id=request.session['shop_lid'])
    product_obj.save()
    return HttpResponse('''<script> alert("product added"); window.location="/manageproduct"</script>''')

def edit_product(request, id):
    request.session['id'] = id
    product_obj = product_table.objects.get(id=id)
    return render(request, "shop/edit product.html", {'val': product_obj})

def editproduct_post(request):
    try:
        Product = request.POST['textfield']
        Price = request.POST['textfield2']
        Stock = request.POST['textfield3']
        Image = request.FILES['file']
        fa = FileSystemStorage()
        photo_file = fa.save(Image.name, Image)

        product_obj = product_table.objects.get(id=request.session['id'])
        product_obj.product = Product
        product_obj.price = Price
        product_obj.stock = Stock
        product_obj.image = photo_file
        product_obj.save()

        return HttpResponse('''<script> alert("product edited"); window.location="/manageproduct"</script>''')
    except:
        Product = request.POST['textfield']
        Price = request.POST['textfield2']
        Stock = request.POST['textfield3']

        product_obj = product_table.objects.get(id=request.session['id'])
        product_obj.product = Product
        product_obj.price = Price
        product_obj.stock = Stock
        product_obj.save()

        return HttpResponse('''<script> alert("product edited"); window.location="/manageproduct"</script>''')


def delete_product(request, id):
    product_obj = product_table.objects.get(id=id)
    product_obj.delete()

    return HttpResponse('''<script> alert("product deleted"); window.location="/manageproduct"</script>''')

def product_search(request):
    search = request.POST['textfield']
    product_obj = product_table.objects.filter(product__istartswith=search)
    if not product_obj:
        return HttpResponse('''<script> alert("product not found"); window.location="/manageproduct"</script>''')
    else:
        return render(request,"shop/Manage product.html", {'val': product_obj, 'val1': search})

def viewrating(request):
    obj = rating_table.objects.all()
    return render(request,"shop/View Rating.html",{'val':obj})

def search_rating(request):
    date = request.POST['textfield']
    obj = rating_table.objects.filter(date=date)
    return render(request, "shop/View Rating.html", {'val': obj})

def manageoffer(request):
    ob = offer_table.objects.filter(product__shop__login_id=request.session['shop_lid'])
    return render(request,"shop/Manage offer.html", {"val":ob})


def addoffer(request):
    ob = product_table.objects.filter(shop__login__id=request.session['shop_lid'])
    return render(request,"shop/Add offer.html",{"val":ob})


def addoffers_post(request):
    product = request.POST['select']
    offerprice = request.POST['textfield']
    stdate = request.POST['date']
    eddate = request.POST['date']

    offer_obj = offer_table()
    offer_obj.product = product_table.objects.get(id=product)
    offer_obj.offer_price = offerprice
    offer_obj.start_date = stdate
    offer_obj.end_date = eddate
    offer_obj.save()
    return HttpResponse('''<script> alert("offer added"); window.location="/manageoffer"</script>''')

def edit_offer(request, id):
    request.session['id'] = id
    offer_obj = offer_table.objects.get(id=id)
    ob=product_table.objects.filter(shop__login__id=request.session['shop_lid'])
    return render(request, "shop/edit offer.html", {'val': offer_obj,'val1':ob,'date':str(offer_obj.start_date),'date1':str(offer_obj.end_date)})


def editoffer_post(request):
    offerprice = request.POST['textfield']
    stdate = request.POST['date']
    eddate = request.POST['date']

    offer_obj = offer_table.objects.get(id=request.session['id'])
    offer_obj.offer_price = offerprice
    offer_obj.start_date = stdate
    offer_obj.end_date = eddate
    offer_obj.save()
    return HttpResponse('''<script> alert("offer edited"); window.location="/manageoffer"</script>''')

def delete_offer(request, id):
    delete_obj = offer_table.objects.get(id=id)
    delete_obj.delete()

    return HttpResponse('''<script> alert("offer deleted"); window.location="/manageoffer"</script>''')

def offer_search(request):
    search = request.POST['textfield']
    offer_obj = offer_table.objects.filter(product__product__istartswith=search)
    if not offer_obj:
        return HttpResponse('''<script> alert("offer not found"); window.location="/manageoffer"</script>''')
    else:
        return render(request, "shop/Manage offer.html", {'val': offer_obj, 'val1': search,'s':search})


def vieworder(request):
    obj = order_table.objects.all()
    return render(request,"shop/View orders.html" ,{'val':obj})

def search(request):
    date = request.POST['textfield']
    obj = order_table.objects.filter(date=date)
    return render(request,"shop/View orders.html" ,{'val':obj})

def viewitem(request,id):

    obj =order_details_table.objects.filter(order__id=id)
    return render(request,"shop/view items.html",{'val':obj})






