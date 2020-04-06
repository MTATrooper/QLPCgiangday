namespace QLPCgiangday.GUI
{
    partial class ucImportCNPM
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
            this.dataPC_CNPM = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.dataPC_CNPM)).BeginInit();
            this.SuspendLayout();
            // 
            // dataPC_CNPM
            // 
            this.dataPC_CNPM.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataPC_CNPM.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dataPC_CNPM.Location = new System.Drawing.Point(0, 0);
            this.dataPC_CNPM.Name = "dataPC_CNPM";
            this.dataPC_CNPM.Size = new System.Drawing.Size(839, 452);
            this.dataPC_CNPM.TabIndex = 2;
            // 
            // ucImportCNPM
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.dataPC_CNPM);
            this.Name = "ucImportCNPM";
            this.Size = new System.Drawing.Size(839, 452);
            this.Load += new System.EventHandler(this.ucImportCNPM_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataPC_CNPM)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dataPC_CNPM;
    }
}
