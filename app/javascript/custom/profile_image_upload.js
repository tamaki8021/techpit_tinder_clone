const profile_image_upload = document.getElementById("profile_image_upload");

if (profile_image_upload) {
  profile_image_upload.addEventListener("change", function (e) {
    if (e.target.files.length) {
      let reader = new FileReader();
      reader.onload = function (e) {
        const profileImage = document.getElementById("profile-img");
        const profileImagePrev = document.getElementById("profile-img-prev");
        const profileDefaultImg = document.querySelector(
          ".profile-default-img"
        );

        profileImagePrev.classList.remove("hidden");
        if (profileDefaultImg != null)
          profileDefaultImg.classList.remove("profile-default-img");
        if (profileImage != null)
          profileImage.parentNode.removeChild(profileImage);
        profileImagePrev.setAttribute("src", e.target.result);
      };
      return reader.readAsDataURL(e.target.files[0]);
    }
  });
}
