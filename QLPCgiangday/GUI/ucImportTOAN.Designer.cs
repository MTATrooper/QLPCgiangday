namespace QLPCgiangday.GUI
{
    partial class ucImportTOAN
    {
        /// <summary> 
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.dataPC_TOAN = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.dataPC_TOAN)).BeginInit();
            this.SuspendLayout();
            // 
            // dataPC_TOAN
            // 
            this.dataPC_TOAN.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataPC_TOAN.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dataPC_TOAN.Location = new System.Drawing.Point(0, 0);
            this.dataPC_TOAN.Name = "dataPC_TOAN";
            this.dataPC_TOAN.Size = new System.Drawing.Size(902, 438);
            this.dataPC_TOAN.TabIndex = 2;
            // 
            // ucImportTOAN
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.dataPC_TOAN);
            this.Name = "ucImportTOAN";
            this.Size = new System.Drawing.Size(902, 438);
            this.Load += new System.EventHandler(this.ucImportTOAN_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataPC_TOAN)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dataPC_TOAN;
    }
}
