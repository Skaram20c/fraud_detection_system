function toggleTxMenu(event) {
    event.stopPropagation();
    const menu = document.getElementById("tx-menu");
    menu.style.display = (menu.style.display === "block") ? "none" : "block";
}

function setTxFilter(key) {
    const label = {
        all: "All time",
        week: "Last 7 days",
        month: "This month",
        year: "This year"
    };

    document.getElementById("tx-count-display").innerText = txData[key];
    document.getElementById("tx-period-label").innerText = label[key];

    document.getElementById("tx-menu").style.display = "none";
}

document.addEventListener("click", () => {
    const menu = document.getElementById("tx-menu");
    if (menu) menu.style.display = "none";
});

document.addEventListener('DOMContentLoaded', function () {
    const btn = document.getElementById('customerAccountBtn');
    const menu = document.getElementById('customerAccountMenu');

    if (btn && menu) {
        btn.addEventListener('click', function (e) {
            e.stopPropagation();
            menu.classList.toggle('open');
        });

        document.addEventListener('click', function () {
            menu.classList.remove('open');
        });

        menu.addEventListener('click', function (e) {
            e.stopPropagation();
        });
    }
});
