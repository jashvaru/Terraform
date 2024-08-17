resource "aws_instance" "myec2" {
  ami                    = "ami-0a4408457f9a03be3"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-03d32534f9b9942d5"]
  key_name               = "terrform-key"

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("./terrform-key.pem")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum -y install nginx",
      "sudo systemctl start nginx"
    ]
  }
}


/*  
Plan: 1 to add, 0 to change, 0 to destroy.
aws_instance.myec2: Creating...
aws_instance.myec2: Still creating... [10s elapsed]
aws_instance.myec2: Still creating... [20s elapsed]
aws_instance.myec2: Still creating... [30s elapsed]
aws_instance.myec2: Provisioning with 'remote-exec'...
aws_instance.myec2 (remote-exec): Connecting to remote host via SSH...
aws_instance.myec2 (remote-exec):   Host: 13.201.16.110
aws_instance.myec2 (remote-exec):   User: ec2-user
aws_instance.myec2 (remote-exec):   Password: false
aws_instance.myec2 (remote-exec):   Private key: true
aws_instance.myec2 (remote-exec):   Certificate: false
aws_instance.myec2 (remote-exec):   SSH Agent: false
aws_instance.myec2 (remote-exec):   Checking Host Key: false
aws_instance.myec2 (remote-exec):   Target Platform: unix
aws_instance.myec2 (remote-exec): Connecting to remote host via SSH...
aws_instance.myec2 (remote-exec):   Host: 13.201.16.110
aws_instance.myec2 (remote-exec):   User: ec2-user
aws_instance.myec2 (remote-exec):   Password: false
aws_instance.myec2 (remote-exec):   Private key: true
aws_instance.myec2 (remote-exec):   Certificate: false
aws_instance.myec2 (remote-exec):   SSH Agent: false
aws_instance.myec2 (remote-exec):   Checking Host Key: false
aws_instance.myec2 (remote-exec):   Target Platform: unix
aws_instance.myec2 (remote-exec): Connected!
aws_instance.myec2 (remote-exec): Amazon  ---  B/s |   0  B     --:-- ETA
aws_instance.myec2 (remote-exec): Amazon  1.8 MB/s | 575 kB     00:13 ETA
aws_instance.myec2 (remote-exec): Amazon   32 MB/s |  26 MB     00:00
aws_instance.myec2: Still creating... [40s elapsed]
aws_instance.myec2: Still creating... [50s elapsed]
aws_instance.myec2 (remote-exec): Amazon  ---  B/s |   0  B     --:-- ETA
aws_instance.myec2 (remote-exec): Amazon   37 kB/s |  11 kB     00:00
aws_instance.myec2 (remote-exec): Last metadata expiration check: 0:00:01 ago on Sat Aug 17 13:30:41 2024.
aws_instance.myec2 (remote-exec): Dependencies resolved.
aws_instance.myec2 (remote-exec): ========================================
aws_instance.myec2 (remote-exec):  Package    Arch   Version
aws_instance.myec2 (remote-exec):                       Repository   Size
aws_instance.myec2 (remote-exec): ========================================
aws_instance.myec2 (remote-exec): Installing:
aws_instance.myec2 (remote-exec):  nginx      x86_64 1:1.24.0-1.amzn2023.0.2
aws_instance.myec2 (remote-exec):                       amazonlinux  32 k
aws_instance.myec2 (remote-exec): Installing dependencies:
aws_instance.myec2 (remote-exec):  generic-logos-httpd
aws_instance.myec2 (remote-exec):             noarch 18.0.0-12.amzn2023.0.3
aws_instance.myec2 (remote-exec):                       amazonlinux  19 k
aws_instance.myec2 (remote-exec):  gperftools-libs
aws_instance.myec2 (remote-exec):             x86_64 2.9.1-1.amzn2023.0.3
aws_instance.myec2 (remote-exec):                       amazonlinux 308 k
aws_instance.myec2 (remote-exec):  libunwind  x86_64 1.4.0-5.amzn2023.0.2
aws_instance.myec2 (remote-exec):                       amazonlinux  66 k
aws_instance.myec2 (remote-exec):  nginx-core x86_64 1:1.24.0-1.amzn2023.0.2
aws_instance.myec2 (remote-exec):                       amazonlinux 586 k
aws_instance.myec2 (remote-exec):  nginx-filesystem
aws_instance.myec2 (remote-exec):             noarch 1:1.24.0-1.amzn2023.0.2
aws_instance.myec2 (remote-exec):                       amazonlinux 9.1 k
aws_instance.myec2 (remote-exec):  nginx-mimetypes
aws_instance.myec2 (remote-exec):             noarch 2.1.49-3.amzn2023.0.3
aws_instance.myec2 (remote-exec):                       amazonlinux  21 k

aws_instance.myec2 (remote-exec): Transaction Summary
aws_instance.myec2 (remote-exec): ========================================
aws_instance.myec2 (remote-exec): Install  7 Packages

aws_instance.myec2 (remote-exec): Total download size: 1.0 M
aws_instance.myec2 (remote-exec): Installed size: 3.4 M
aws_instance.myec2 (remote-exec): Downloading Packages:
aws_instance.myec2 (remote-exec): Amazon  ---  B/s |   0  B     --:-- ETA
aws_instance.myec2 (remote-exec): (1/7):  ---  B/s |   0  B     --:-- ETA
aws_instance.myec2 (remote-exec): (1/7):  187 kB/s |  19 kB     00:00
aws_instance.myec2 (remote-exec): (2-3/7) 187 kB/s |  19 kB     00:05 ETA
aws_instance.myec2 (remote-exec): (2/7):  2.8 MB/s | 308 kB     00:00
aws_instance.myec2 (remote-exec): (3-4/7) 249 kB/s | 327 kB     00:02 ETA
aws_instance.myec2 (remote-exec): (3/7):  593 kB/s |  66 kB     00:00
aws_instance.myec2 (remote-exec): (4-5/7) 262 kB/s | 393 kB     00:02 ETA
aws_instance.myec2 (remote-exec): (4/7):  1.8 MB/s |  32 kB     00:00
aws_instance.myec2 (remote-exec): (5-6/7) 268 kB/s | 425 kB     00:02 ETA
aws_instance.myec2 (remote-exec): (5/7):  622 kB/s | 9.1 kB     00:00
aws_instance.myec2 (remote-exec): (6-7/7) 269 kB/s | 434 kB     00:02 ETA
aws_instance.myec2 (remote-exec): (6/7):   18 MB/s | 586 kB     00:00
aws_instance.myec2 (remote-exec): (7/7):  386 kB/s | 1.0 MB     00:00 ETA
aws_instance.myec2 (remote-exec): (7/7):  912 kB/s |  21 kB     00:00
aws_instance.myec2 (remote-exec): ----------------------------------------
aws_instance.myec2 (remote-exec): Total   4.3 MB/s | 1.0 MB     00:00
aws_instance.myec2 (remote-exec): Running transaction check
aws_instance.myec2 (remote-exec): Transaction check succeeded.
aws_instance.myec2 (remote-exec): Running transaction test
aws_instance.myec2 (remote-exec): Transaction test succeeded.
aws_instance.myec2 (remote-exec): Running transaction
aws_instance.myec2 (remote-exec):   Preparing        :  [=          ] 1/1
aws_instance.myec2 (remote-exec):   Preparing        :  [===        ] 1/1
aws_instance.myec2 (remote-exec):   Preparing        :  [====       ] 1/1
aws_instance.myec2 (remote-exec):   Preparing        :  [======     ] 1/1
aws_instance.myec2 (remote-exec):   Preparing        :  [=======    ] 1/1
aws_instance.myec2 (remote-exec):   Preparing        :  [=========  ] 1/1
aws_instance.myec2 (remote-exec):   Preparing        :                1/1
aws_instance.myec2 (remote-exec):   Running scriptlet: nginx-filesy   1/7
aws_instance.myec2 (remote-exec):   Installing       : nginx [      ] 1/7
aws_instance.myec2 (remote-exec):   Installing       : nginx [=     ] 1/7
aws_instance.myec2 (remote-exec):   Installing       : nginx [==    ] 1/7
aws_instance.myec2 (remote-exec):   Installing       : nginx [===   ] 1/7
aws_instance.myec2 (remote-exec):   Installing       : nginx [====  ] 1/7
aws_instance.myec2 (remote-exec):   Installing       : nginx [===== ] 1/7
aws_instance.myec2 (remote-exec):   Installing       : nginx-filesy   1/7
aws_instance.myec2 (remote-exec):   Installing       : nginx [      ] 2/7
aws_instance.myec2 (remote-exec):   Installing       : nginx [====  ] 2/7
aws_instance.myec2 (remote-exec):   Installing       : nginx [===== ] 2/7
aws_instance.myec2 (remote-exec):   Installing       : nginx-mimety   2/7
aws_instance.myec2 (remote-exec):   Installing       : libun [      ] 3/7
aws_instance.myec2 (remote-exec):   Installing       : libun [=     ] 3/7
aws_instance.myec2 (remote-exec):   Installing       : libun [===   ] 3/7
aws_instance.myec2 (remote-exec):   Installing       : libun [====  ] 3/7
aws_instance.myec2 (remote-exec):   Installing       : libun [===== ] 3/7
aws_instance.myec2 (remote-exec):   Installing       : libunwind-1.   3/7
aws_instance.myec2 (remote-exec):   Installing       : gperf [      ] 4/7
aws_instance.myec2 (remote-exec):   Installing       : gperf [=     ] 4/7
aws_instance.myec2 (remote-exec):   Installing       : gperf [==    ] 4/7
aws_instance.myec2 (remote-exec):   Installing       : gperf [===   ] 4/7
aws_instance.myec2 (remote-exec):   Installing       : gperf [====  ] 4/7
aws_instance.myec2 (remote-exec):   Installing       : gperf [===== ] 4/7
aws_instance.myec2 (remote-exec):   Installing       : gperftools-l   4/7
aws_instance.myec2 (remote-exec):   Installing       : nginx [      ] 5/7
aws_instance.myec2 (remote-exec):   Installing       : nginx [=     ] 5/7
aws_instance.myec2 (remote-exec):   Installing       : nginx [==    ] 5/7
aws_instance.myec2 (remote-exec):   Installing       : nginx [===   ] 5/7
aws_instance.myec2 (remote-exec):   Installing       : nginx [====  ] 5/7
aws_instance.myec2 (remote-exec):   Installing       : nginx [===== ] 5/7
aws_instance.myec2 (remote-exec):   Installing       : nginx-core-1   5/7
aws_instance.myec2 (remote-exec):   Installing       : gener [      ] 6/7
aws_instance.myec2 (remote-exec):   Installing       : gener [====  ] 6/7
aws_instance.myec2 (remote-exec):   Installing       : gener [===== ] 6/7
aws_instance.myec2 (remote-exec):   Installing       : generic-logo   6/7
aws_instance.myec2 (remote-exec):   Installing       : nginx [      ] 7/7
aws_instance.myec2 (remote-exec):   Installing       : nginx [==    ] 7/7
aws_instance.myec2 (remote-exec):   Installing       : nginx [===   ] 7/7
aws_instance.myec2 (remote-exec):   Installing       : nginx [===== ] 7/7
aws_instance.myec2 (remote-exec):   Installing       : nginx-1:1.24   7/7
aws_instance.myec2 (remote-exec):   Running scriptlet: nginx-1:1.24   7/7
aws_instance.myec2 (remote-exec):   Verifying        : generic-logo   1/7
aws_instance.myec2 (remote-exec):   Verifying        : gperftools-l   2/7
aws_instance.myec2 (remote-exec):   Verifying        : libunwind-1.   3/7
aws_instance.myec2 (remote-exec):   Verifying        : nginx-1:1.24   4/7
aws_instance.myec2 (remote-exec):   Verifying        : nginx-core-1   5/7
aws_instance.myec2 (remote-exec):   Verifying        : nginx-filesy   6/7
aws_instance.myec2 (remote-exec):   Verifying        : nginx-mimety   7/7

aws_instance.myec2 (remote-exec): Installed:
aws_instance.myec2 (remote-exec):   generic-logos-httpd-18.0.0-12.amzn2023.0.3.noarch
aws_instance.myec2 (remote-exec):   gperftools-libs-2.9.1-1.amzn2023.0.3.x86_64
aws_instance.myec2 (remote-exec):   libunwind-1.4.0-5.amzn2023.0.2.x86_64
aws_instance.myec2 (remote-exec):   nginx-1:1.24.0-1.amzn2023.0.2.x86_64
aws_instance.myec2 (remote-exec):   nginx-core-1:1.24.0-1.amzn2023.0.2.x86_64
aws_instance.myec2 (remote-exec):   nginx-filesystem-1:1.24.0-1.amzn2023.0.2.noarch
aws_instance.myec2 (remote-exec):   nginx-mimetypes-2.1.49-3.amzn2023.0.3.noarch

aws_instance.myec2 (remote-exec): Complete!
aws_instance.myec2: Creation complete after 56s [id=i-0d3d9b60b001c35b7]
*/

/*  

Welcome to nginx!
If you see this page, the nginx web server is successfully installed and working. Further configuration is required.

For online documentation and support please refer to nginx.org.
Commercial support is available at nginx.com.

Thank you for using nginx.

*/
