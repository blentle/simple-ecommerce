function FileProgress(file, targetID) {
	this.fileProgressID = file.id;
	this.opacity = 100;
	this.height = 0;
	this.fileProgressWrapper = document.getElementById(this.fileProgressID);
	if (!this.fileProgressWrapper) {
		this.fileProgressWrapper = document.createElement("div");
		this.fileProgressWrapper.className = "progressWrapper";
		this.fileProgressWrapper.id = this.fileProgressID;
		this.fileProgressElement = document.createElement("div");
		this.fileProgressElement.className = "progressContainer";
		var progressText = document.createElement("div");
		progressText.className = "progressName";
		progressText.appendChild(document.createTextNode(file.name));
		var progressBarDiv = document.createElement("div");
		progressBarDiv.className = "progress progress-indicator progress-striped active";
		var progressBar = document.createElement("div");
		progressBar.className = "bar";
		progressBar.style.width= file.percent + "%";
		progressBarDiv.appendChild(progressBar);
		var progressStatus = document.createElement("div");
		progressStatus.className = "progressBarStatus";
		progressStatus.innerHTML = "&nbsp;";
		this.fileProgressElement.appendChild(progressText);
		this.fileProgressElement.appendChild(progressStatus);
		this.fileProgressElement.appendChild(progressBarDiv);

		this.fileProgressWrapper.appendChild(this.fileProgressElement);

		document.getElementById(targetID).appendChild(this.fileProgressWrapper);
	} else {
		this.fileProgressElement = this.fileProgressWrapper.firstChild;
	}

	this.height = this.fileProgressWrapper.offsetHeight;

}
FileProgress.prototype.setProgress = function (percentage) {
	this.fileProgressElement.className = "progressContainer green";
	this.fileProgressElement.childNodes[2].className = "progress progress-indicator progress-striped active";
	this.fileProgressElement.childNodes[2].childNodes[0].style.width = percentage + "%";
};
FileProgress.prototype.setComplete = function () {
	this.fileProgressElement.className = "progressContainer blue";
	this.fileProgressElement.childNodes[2].className = "progress progress-success progress-striped active";
	this.fileProgressElement.childNodes[2].childNodes[0].style.width = "100%";
};
FileProgress.prototype.setError = function () {
	this.fileProgressElement.className = "progressContainer red";
	this.fileProgressElement.childNodes[2].className = "progress progress-danger progress-striped active";
	this.fileProgressElement.childNodes[2].childNodes[0].style.width = "";
};
FileProgress.prototype.setStatus = function (status) {
	this.fileProgressElement.childNodes[1].innerHTML = status;
};