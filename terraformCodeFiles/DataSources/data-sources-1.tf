data "local_file" "foo" {
  filename = "${path.module}/demo.txt"
}

/*  
data block reads the file and details are stored in tfstate file

{
  "version": 4,
  "terraform_version": "1.9.2",
  "serial": 46,
  "lineage": "fc29ad69-bb71-0e16-3a2d-b504bccbb538",
  "outputs": {},
  "resources": [
    {
      "mode": "data",
      "type": "local_file",
      "name": "foo",
      "provider": "provider[\"registry.terraform.io/hashicorp/local\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "content": "This is a demo file.",
            "content_base64": "VGhpcyBpcyBhIGRlbW8gZmlsZS4=",
            "content_base64sha256": "gcDikfi3eUyg63UNmHQdoxFweDJsuVyRWdebbFO7nuI=",
            "content_base64sha512": "xzjtXQ2V0J5rmjnr+4oI+9T86eEOevjNmiXmcT5JpUbUhn4IkYceC0pIU9Ysq4+FblR89NXOTWhbB53gx1mh6g==",
            "content_md5": "8e00d0e4de2b5d8c4ba0c681b814d0ea",
            "content_sha1": "89295cc484f72bf84f585ccebaabd58921645517",
            "content_sha256": "81c0e291f8b7794ca0eb750d98741da3117078326cb95c9159d79b6c53bb9ee2",
            "content_sha512": "c738ed5d0d95d09e6b9a39ebfb8a08fbd4fce9e10e7af8cd9a25e6713e49a546d4867e0891871e0b4a4853d62cab8f856e547cf4d5ce4d685b079de0c759a1ea",
            "filename": "./demo.txt",
            "id": "89295cc484f72bf84f585ccebaabd58921645517"
          },
          "sensitive_attributes": []
        }
      ]
    }
  ],
  "check_results": null
}

*/
