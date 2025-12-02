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

document.addEventListener('DOMContentLoaded', function () {

    const txBtn = document.getElementById('txHistoryBtn');
    if (txBtn) {
        txBtn.addEventListener('click', function() {
            window.location.href = "/transaction_history";
        });
    }

});

document.addEventListener('DOMContentLoaded', function () {

    const casesBtn = document.getElementById('casesBtn');
    if (casesBtn) {
        casesBtn.addEventListener('click', function() {
            window.location.href = "/cases";
        });
    }

});

document.addEventListener('DOMContentLoaded', function() {

    // ALERT DROPDOWN
    const bell = document.getElementById("alertBell");
    const dropdown = document.getElementById("alertDropdown");
    const alertList = document.getElementById("alertList");

    if (bell) {
        bell.addEventListener("click", async function (e) {
            e.stopPropagation();

            // Toggle dropdown
            dropdown.style.display = (dropdown.style.display === "block") ? "none" : "block";

            // Fetch alerts
            const res = await fetch("/api/alerts");
            const alerts = await res.json();

            alertList.innerHTML = ""; // clear

            if (alerts.length === 0) {
                alertList.innerHTML = "<div class='dropdown-item'>No new alerts</div>";
                return;
            }

            alerts.forEach(a => {
                alertList.innerHTML += `
                    <div class="alert-item" onclick="window.location.href='/case/${a.alert_id}'">
                        <div class="alert-title">${a.risk_level} Risk - $${a.amount}</div>
                        <div class="alert-meta">${a.customer_name} | Tx ${a.transaction_id}</div>
                    </div>
                `;
            });
        });
    }

    // Close when clicking outside
    document.addEventListener("click", function () {
        dropdown.style.display = "none";
    });

});

document.addEventListener('DOMContentLoaded', function () {

    const input = document.getElementById("globalSearchInput");
    const box = document.getElementById("globalSearchResults");

    if (input) {
        input.addEventListener("keyup", async function () {
            const q = input.value.trim();
            if (q.length < 2) {
                box.style.display = "none";
                return;
            }

            const res = await fetch(`/api/search?q=${q}`);
            const data = await res.json();

            box.innerHTML = "";
            box.style.display = "block";

            if (data.length === 0) {
                box.innerHTML = "<div class='search-item'>No results found</div>";
                return;
            }

            data.forEach(item => {
                box.innerHTML += `
                    <div class="search-item" onclick="window.location='/search?q=${item.title}'">
                        <div class="search-title">${item.title}</div>
                        <div class="search-type">${item.type} — ${item.subtitle}</div>
                    </div>
                `;
            });
        });
    }

    // Close dropdown when clicking outside
    document.addEventListener("click", () => {
        box.style.display = "none";
    });

});


