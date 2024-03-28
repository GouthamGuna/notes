# March Notes:

 **Maximum Odd Binary Number**

    var maximumOddBinaryNumber = function(s) {
        const ans = Array(s.length).fill('0');
        let j = 0;

        for (let i = 0; i < s.length; i++) {
            if (s[i] === '1') {
                ans[j++] = '1';
            }
        }

        let sol = ans.join('');
        ans[j - 1] = ans[s.length - 1];
        ans[s.length - 1] = '1';
        sol = ans.join('');

        return sol;
    };

## Handle Api Error

    function handleApiError(name, error) {
        try {
            if (!error) {
                return;
            }
            const errorObj = new Error(error);
            if (error.response && error.response.status) {
                errorObj.status = error.response.status;
                errorObj.name = `APIError: ${name} [${errorObj.status}]`;
            } else {
                errorObj.name = `APIError: ${name}`;
            }
            if (error.response && error.response.data) {
                errorObj.message = error.response.data;
            }
            errorObj.date = new Date();
            if (window.Sentry) {
                window.Sentry.captureException(errorObj);
            }
        } catch (e) {
            window.Sentry.captureException(e);   
        }
    }