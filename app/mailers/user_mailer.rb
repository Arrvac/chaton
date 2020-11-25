class UserMailer < ApplicationMailer
    default from: 'Do-not-reply@yopmail.com'
   
    def welcome_email(user)
      #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
      @user = user 
  
      #on définit une variable @url qu'on utilisera dans la view d’e-mail
      @url  = 'http://monsite.fr/login' 
  
      # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
      mail(to: @user.email, subject: 'Bienvenue chez nous !') 
    end

    def order_email(order)
      @order = order 
      @user = User.find(order.user_id)
      @admin = User.find_by(is_admin?: true)
      @cart = @user.cart
      @url = 'http://monsite.fr'
      mail(to: @user.email, subject: 'Merci pour votre commande !')
      mail(to: @admin.email, subject: 'Récapitulatif d\'une commande')
    end
end
