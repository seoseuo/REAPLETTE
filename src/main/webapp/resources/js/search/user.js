function follow(event) {
    const button = event.target;
    const userId = button.getAttribute('data-user-id');
    const currentUserId = button.getAttribute('data-current-user-id');

    fetch('/search/total/user/follow', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            followingId: userId,
            followerId: currentUserId
        })
    })
    .then(response => response.json())
    .then(data => {
        console.log('Success:', data);
        // UI 업데이트
        button.innerHTML = "팔로잉";
        button.style.backgroundColor = "#007bff";
        button.style.color = "white";
        button.style.border = "none";
        button.setAttribute('onclick', 'unfollow(event)');
    })
    .catch(error => {
        console.error('Error:', error);
    });
}

function unfollow(event) {
    const button = event.target;
    const userId = button.getAttribute('data-user-id');
    const currentUserId = button.getAttribute('data-current-user-id');

    fetch('/search/total/user/unfollow', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            followingId: userId,
            followerId: currentUserId
        })
    })
    .then(response => response.json())
    .then(data => {
        console.log('Success:', data);
        // UI 업데이트
        button.innerHTML = "팔로우";
        button.style.backgroundColor = "white";
        button.style.color = "#007bff";
        button.style.border = "2px solid #007bff";
        button.setAttribute('onclick', 'follow(event)');
    })
    .catch(error => {
        console.error('Error:', error);
    });
}
