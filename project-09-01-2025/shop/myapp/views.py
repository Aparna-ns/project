from django.shortcuts import get_object_or_404, render,HttpResponse,redirect
from django.utils import timezone
from .models import *

def user_reg(request):
    if request.method=='POST':
        uname=request.POST.get('uname')
        uemail=request.POST.get('uemail')
        house=request.POST.get('housename')
        town=request.POST.get('town')
        pin=request.POST.get('pin')
        uphone=request.POST.get('uphone')
        upassw=request.POST.get('upassword')

        obj1=login()
        obj1.username=uname
        obj1.password=upassw
        obj1.usertype='user'
        obj1.save()

        obj=users()
        obj.LOGIN=obj1
        obj.uname=uname
        obj.uemail=uemail
        obj.housename=house
        obj.town=town
        obj.pin=pin
        obj.uphone=uphone
        obj.upassword=upassw
        obj.save()
        return render(request,'aromalogin.html')
    return render(request,'aromareg.html')

def staffs(request):
    if request.method=='POST':
        uname=request.POST.get('sname')
        semail=request.POST.get('semail')
        address=request.POST.get('address')
        sphone=request.POST.get('sphone')
        spassw=request.POST.get('spassword')
        pic=request.FILES.get('sphoto')

        obj1=login()
        obj1.username=uname
        obj1.password=spassw
        obj1.usertype='staff'
        obj1.save()

        obj=staff()
        obj.LOGIN=obj1
        obj.sname=uname
        obj.semail=semail
        obj.address=address
        obj.sphone=sphone
        obj.spassword=spassw
        obj.sphoto=pic
        obj.save()
        return render(request,'aromalogin.html')
    return render(request,'staff.html')


def login_page(request):
    if request.method =='POST':
        name=request.POST.get('username')
        word=request.POST.get('password')
        staff_obj=login.objects.filter(username=name,password=word, usertype='staff').first()
        if staff_obj:
            request.session['login_id']=staff_obj.id
            request.session['username']=staff_obj.username
            return HttpResponse('<script>alert("Welcome!"); window.location="/aromastaff";</script>')
        
        user_obj=login.objects.filter(username=name,password=word, usertype='user').first()
        if user_obj:
            request.session['login_id']=user_obj.id
            request.session['username']=user_obj.username
            return HttpResponse('<script>alert("Welcome!"); window.location="/aromauserpage";</script>')
        else:
            return HttpResponse('<script>alert("invalid"); window.location="/";</script>')
    else:
        return render(request,'aromalogin.html')
    
def display(request):
    return render(request,'staff_home.html')

def proadd(request):
    if request.method=='POST':
        pname=request.POST.get('pname')
        psize= request.POST.getlist('checkbox')
        q = ','.join(psize)
        category=request.POST.get('category')
        pamount=request.POST.get('pamount')
        pphoto=request.FILES.get('pphoto')
        sizephoto=request.FILES.get('sizephoto')


        obj=product()
        obj.pname=pname
        obj.psize=q
        obj.category=category
        obj.pamount=pamount
        obj.pphoto=pphoto
        obj.sizephoto=sizephoto
        obj.save()

    return render(request,'aromaproadd.html')

def viewproduct(request):
    obj1=product.objects.all()
    # print("obj",obj1.pphoto)
    return render(request,'productview.html',{'products':obj1})

def delete_pro(request,id):
    obj=product.objects.get(id=id)
    obj.delete()
    std=product.objects.all()
    return render(request,'productview.html',{'products':std})

def update_pro(request,id):
    if request.method=='POST':
        name=request.POST.get('pname')
        psize= request.POST.getlist('checkbox')
        q = ','.join(psize)
        pcategory=request.POST.get('select1')
        amount=request.POST.get('pamount')
        obj=product.objects.get(id=id)
        
        # if request.POST.get('pro_photo') != '':
        #     pro_file=request.POST.get('pro_photo')
        # else:
        #     obj2=product.objects.get(id=id)
        #     pro_file= obj2.pphoto
        # if request.POST.get('size_photo') != '':
        #     file2=request.POST.get('size_photo')
        # else:
        #     obj2=product.objects.get(id=id)
        #     file2= obj2.sizephoto
        # print("sgsg",pro_file)
        obj2=product.objects.get(id=id)
        pro_file= obj2.pphoto
        file2= obj2.sizephoto
        obj.pname=name
        obj.psize=q
        obj.category=pcategory
        obj.pamount=amount
        obj.pphoto=pro_file
        obj.sizephoto=file2
        obj.save()
        #obj.update(pname=name,psize=q,category=pcategory,pamount=amount,pphoto=pro_file,sizephoto=file2)
        
        return redirect('/productview/')
    obj1=product.objects.get(id=id)
    
    return render(request,'aromaupdate.html',{'product':obj1})

def aromalog(request):
    return render(request,'aromalogin.html')

def aromareg(request):
    return render(request,'aromareg.html')


def index(request):
    unique_categories = product.objects.values('category').distinct()
    print(unique_categories)
    products_by_category = {}
    a=[]
    # For each unique category, get the products belonging to it
    for category in unique_categories:
        category_name = category['category']
        products = product.objects.filter(category=category_name).first()
        products_by_category[category_name] = products
    for i,j in products_by_category.items():
        a.append((i,j))
    products = product.objects.all()
    return render(request,'index.html',{"products":a,'best':products[0:5]})

def arostaff(request):
    return render(request,'aromastaff.html')
def aropro(request):
    return render(request,'aromaproadd.html')

def aroproview(request):
    return render(request,'aromaproview.html')

def aroproupdate(request):
    return render(request,'aromaupdate.html')

def aromauser(request):
    unique_categories = product.objects.values('category').distinct()
   
    products_by_category = {}
    a=[]
    # For each unique category, get the products belonging to it
    for category in unique_categories:
        category_name = category['category']
        products = product.objects.filter(category=category_name).first()
        products_by_category[category_name] = products
    for i,j in products_by_category.items():
        a.append((i,j))
   
    return render(request,'aromauser.html',{"products_by_category":a})

# def winter(request):
#     obj1=product.objects.filter(category='WINTER WEAR')
#     return render(request,'winter.html',{'products':obj1})

# def kurta(request):
#     obj1=product.objects.filter(category='KURTA SETS')
#     return render(request,'kurta.html',{'products':obj1})

# def jeans(request):
#     obj1=product.objects.filter(category='Jeans')
#     return render(request,'jeans.html',{'products':obj1})

# def tops(request):
#     obj1=product.objects.filter(category='TOPS')
#     return render(request,'tops.html',{'products':obj1})

def singlepro(request,id):
    obj = product.objects.get(id=id)
    my_list=obj.psize.split(",")
    reviews=feedback.objects.filter(PRODUCT=id)
    # w=wishlist.objects.filter(PRODUCT=obj)
    if request.session.get('login_id') !=None:
        user=users.objects.get(LOGIN_id=request.session['login_id'])
        w=wishlist.objects.filter(USERS=user,PRODUCT=obj)
        print(w)
        if w :
            status=True
        else:
            status=False
        
    else:
        return render(request, 'aromasingle.html', {'data': obj,'obj':my_list,'reviews':reviews,'count':reviews.count()})

    return render(request, 'aromasingle.html', {'data': obj,'obj':my_list,'reviews':reviews,'count':reviews.count(),'status':status})


def addd_cart(request, id):
    if request.session.get('login_id') !=None:
        qty = request.POST.get('quantity')
        si = request.POST.get('radio')
        p = get_object_or_404(product, id=id)  
        c = cart()  
        c.NAME = p 
        c.quantity = qty
        c.csize = si
        c.USERS = users.objects.get(LOGIN__id=request.session['login_id']) 
        c.save() 
        return HttpResponse("<script>alert('ADDED SUCCESS');window.location='/cartview'</script>")
    else:
        return render(request,'aromalogin.html')

    



def cartview(request):
    crt = cart.objects.filter(USERS__LOGIN=request.session['login_id'])
    sum=0
    # Add total amount calculation for each cart item
    cart_items = []
    for item in crt:
        amount_string = item.NAME.pamount  # Example: 'RS 1200'
        print("amount",amount_string)
        #numeric_part = amount_string.replace('RS', '').strip()  # Strip 'RS' and extra spaces
        amount = float(amount_string)  # Convert to float
        total = amount * int(item.quantity)
        sum+=total  # Calculate total for the cart item
        cart_items.append({
            'id': item.id,
            'productname': item.NAME.pname,
            'sz': item.csize,
            'photo': item.NAME.pphoto,
            'amount': amount,
            'quantity': item.quantity,
            'total': total,
        })
    print("cart",cart_items)
    return render(request, 'cart.html', {"data": cart_items,'subtotal':sum})

def detailview(request,i):
    obj1=product.objects.filter(category=i)
    print("obj1",obj1)
    return render(request,'winter.html',{'products':obj1,"category":i})

def deletepro(request,id):
    obj=cart.objects.get(id=id)
    obj.delete()
    return redirect('/cartview')

def checkout(request):
    print("request.method",request.method)
    if request.method=="POST":
        crt = cart.objects.filter(USERS__LOGIN=request.session['login_id'])
        fname=request.POST.get('fname')
        lname= request.POST.get('lname')
        pnum= request.POST.get('pnumber')
        pin= request.POST.get('pin')
        address= request.POST.get('address')
        locality= request.POST.get('locality')
        district= request.POST.get('district')

        state= request.POST.get('state')

        message = request.POST.get('message')

        for item in crt:
            amount_string = item.NAME.pamount 
            amount = float(amount_string)  
            total = amount * int(item.quantity)
            payment_method=request.POST.get('selector')
            user_id=users.objects.get(LOGIN=request.session['login_id'])
            obj=order_master()
            obj.USERS=user_id
            obj.camount=float(total)
            obj.odate=timezone.now()
            obj.status=payment_method
            obj.save()
            obj1 = delivery()
            obj1.fname=fname
            obj1.lname=lname
            obj1.phone=pnum
            obj1.pin=pin
            obj1.address=address
            obj1.locality=locality
            obj1.district=district
            obj1.state=state

            obj1.other=message
            obj1.ORDER_MASTER=obj
            obj1.save()
            std=order()
            std.PRODUCT=item.NAME
            std.oquantity=item.quantity
            std. osize=item. csize
            std.ORDER_MASTER=obj
            std.save()
            crt.delete()
        
        return HttpResponse("<script>alert('order placed succesfully');window.location='/aromauserpage'</script>")
    else:       
        crt = cart.objects.filter(USERS__LOGIN=request.session['login_id'])
        sum=0
        cart_items = []
        for item in crt:
            amount_string = item.NAME.pamount 
            amount = float(amount_string)  
            total = amount * int(item.quantity)
            sum+=total 
            cart_items.append({
                'id': item.id,
                'productname': item.NAME.pname,
                'quantity': item.quantity,
                'total': total,
            })
        return render(request,'checkout.html',{'products':cart_items,'subtotal':sum})
    
def feed_backs(request,id):
    std=product.objects.get(id=id)
    if request.method=='POST':
        message=request.POST.get('review')
        rating = request.POST.get('rating')
        print("hui",rating)
        obj=feedback()
        obj.feedbacks=message
        obj.fdate=timezone.now()
        obj.USERS=users.objects.get(LOGIN=request.session['login_id'])
        obj.PRODUCT=std
        obj.rating=rating
        obj.save()
        return redirect('history')
    else:
        return render(request,"feedback.html",{"id":id,'std':std})
    
def history(request):
    obj=order_master.objects.filter(USERS__LOGIN=request.session['login_id'])
    a=[]
    for i in obj:
        a.append(order.objects.get( ORDER_MASTER=i))
    return render(request,'history.html',{'product':obj,'details':a})

def userlogout(request):
    request.session.flush()
    return redirect('index')

def wishlists(request):
    user=users.objects.get(LOGIN_id=request.session['login_id'])
    obj=wishlist.objects.filter(USERS=user)
    return render(request,'wishlist.html',{'products' :obj})

def addwishlist(request,id):
    if request.session.get('login_id')==None:
        return redirect('/aromalog')
    pro = product.objects.get(id=id)
    if wishlist.objects.filter(PRODUCT=pro).exists():
        return redirect('singlepro', id=id)
    else:
        std=wishlist()
        std.USERS=users.objects.get(LOGIN_id=request.session['login_id'])
        std.PRODUCT=product.objects.get(id=id)
        std.save()
        return redirect('singlepro', id=id)

def removewishlist(request,id):
    if request.session.get('login_id')==None:
        return redirect('/aromalog')
    pro = product.objects.get(id=id)
    if wishlist.objects.filter(PRODUCT=pro).exists():
        obj = wishlist.objects.get(PRODUCT=pro)
        obj.delete()
        return redirect('singlepro', id=id)
    
    return redirect('singlepro', id=id)